#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT="$DIR/original/CubeEscapeCollection.swf"
OUTPUT="$DIR/assets/CubeEscapeCollection.swf"
PATCHES="$DIR/patches"

if [ ! -f "$INPUT" ]; then
  echo "ERROR: $INPUT not found"
  exit 1
fi

echo "Copying original SWF..."
cp "$INPUT" "$OUTPUT"

echo "Patching AS3 scripts..."
ffdec -replace "$OUTPUT" "$OUTPUT" \
  allCubes "$PATCHES/allCubes.as" \
  SteamHandler "$PATCHES/SteamHandler.as" \
  SaveGameClass "$PATCHES/SaveGameClass.as" \
  BaseClass "$PATCHES/BaseClass.as" \
  cubeSpaceScreen "$PATCHES/cubeSpaceScreen.as" \
  LanguageClass "$PATCHES/LanguageClass.as"

echo "Done. Patched SWF: $OUTPUT"
