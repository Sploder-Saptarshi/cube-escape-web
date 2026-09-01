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
  MenuClass "$PATCHES/MenuClass.as"

echo "==> Step 3: Splitting assets above 25 MB into 24 MB chunks"

PARTS=()
SWF_SIZE=0
HASH=""

shopt -s nullglob

for f in "$ASSETS"/*.swf; do
  [ -e "$f" ] || continue
  size=$(stat -c %s "$f")
  if [ "$size" -le "$THRESHOLD" ]; then
    continue
  fi

  base=$(basename "$f")
  # Remove stale parts from a previous build
  rm -f "$ASSETS/$base".part.*
  SWF_SIZE=$size

  # Use the fast `split` tool (chunks are zero-padded so they sort in order)
  split -b "$CHUNK" -d -a 3 "$f" "$ASSETS/$base.part."
done

# Remove the monolithic file(s) that are now stored as chunks
for f in "$ASSETS"/*.swf; do
  [ -e "$f" ] || continue
  size=$(stat -c %s "$f")
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
  HASH=$(md5sum "$ASSETS/${PARTS[0]}" | cut -d' ' -f1 | cut -c1-12)
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
