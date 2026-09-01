#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT="$DIR/original/CubeEscapeCollection.swf"
OUTPUT="$DIR/assets/CubeEscapeCollection.swf"
PATCHES="$DIR/patches"
ASSETS="$DIR/assets"
MANIFEST="$ASSETS/manifest.json"

CHUNK=$((24 * 1024 * 1024))             # 24 MB chunks
THRESHOLD=$((25 * 1024 * 1024))         # only split assets above 25 MB

if [ ! -f "$INPUT" ]; then
  echo "ERROR: $INPUT not found"
  exit 1
fi

echo "==> Step 1: Copying original files to assets"
cp "$DIR"/original/* "$ASSETS/"

echo "==> Step 2: Patching AS3 scripts"
OUTPUT="$ASSETS/CubeEscapeCollection.swf"
ffdec -replace "$OUTPUT" "$OUTPUT" \
  allCubes "$PATCHES/allCubes.as" \
  SteamHandler "$PATCHES/SteamHandler.as" \
  SaveGameClass "$PATCHES/SaveGameClass.as" \
  BaseClass "$PATCHES/BaseClass.as" \
  cubeSpaceScreen "$PATCHES/cubeSpaceScreen.as" \
  LanguageClass "$PATCHES/LanguageClass.as" \
  pauseScreen "$PATCHES/pauseScreen.as" \
  MenuClass "$PATCHES/MenuClass.as" \
  com.google.analytics.core.GIFRequest "$PATCHES/GIFRequest.as"

echo "==> Step 3: Splitting assets above 25 MB into 24 MB chunks"

PARTS=()
SWF_SIZE=0
HASH=""

shopt -s nullglob

# Cross-platform helpers. GNU (`stat -c`, `md5sum`, `split -d`) and BSD/macOS
# (`stat -f`, `md5`, split without `-d`) syntaxes differ, so delegate to
# python3, which is available on both Linux and macOS runners.

size_of() {
  python3 -c "import os,sys; print(os.path.getsize(sys.argv[1]))" "$1"
}

md5_short() {
  python3 -c "import hashlib,sys; print(hashlib.md5(open(sys.argv[1],'rb').read()).hexdigest()[:12])" "$1"
}

# Split a file into CHUNK-byte pieces named <prefix><base>.part.NNN with
# zero-padded numeric suffixes, so they sort in order (like GNU `split -d -a 3`).
split_parts() {
  python3 - "$1" "$2" "$3" <<'PY'
import os, sys
src, prefix, chunk = sys.argv[1], sys.argv[2], int(sys.argv[3])
with open(src, "rb") as f:
    i = 0
    while True:
        data = f.read(chunk)
        if not data:
            break
        with open("%s.%03d" % (prefix, i), "wb") as out:
            out.write(data)
        i += 1
PY
}

for f in "$ASSETS"/*.swf; do
  [ -e "$f" ] || continue
  size=$(size_of "$f")
  if [ "$size" -le "$THRESHOLD" ]; then
    continue
  fi

  base=$(basename "$f")
  # Remove stale parts from a previous build
  rm -f "$ASSETS/$base".part.*
  SWF_SIZE=$size

  split_parts "$f" "$ASSETS/$base.part" "$CHUNK"
done

# Remove the monolithic file(s) that are now stored as chunks
for f in "$ASSETS"/*.swf; do
  [ -e "$f" ] || continue
  size=$(size_of "$f")
  if [ "$size" -gt "$THRESHOLD" ]; then
    rm -f "$f"
  fi
done

# Collect the chunk files in sorted order
for p in "$ASSETS"/*.part.*; do
  [ -e "$p" ] || continue
  PARTS+=("$(basename "$p")")
done

if [ "${#PARTS[@]}" -gt 0 ]; then
  HASH=$(md5_short "$ASSETS/${PARTS[0]}")
fi

# Build manifest.json without external tools
{
  echo '{'
  echo '  "parts": ['
  n=${#PARTS[@]}
  for i in "${!PARTS[@]}"; do
    comma=","
    if [ "$i" -eq $((n - 1)) ]; then comma=""; fi
    printf '    "%s"%s\n' "${PARTS[$i]}" "$comma"
  done
  echo '  ],'
  echo '  "hash": "'"$HASH"'",'
  echo '  "swfSize": '"$SWF_SIZE"
  echo '}'
} > "$MANIFEST"

echo "==> Done. Build manifest: $MANIFEST"
cat "$MANIFEST"
