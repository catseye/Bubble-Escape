#!/bin/sh

# This script assumes you have Ophis version 2.0.  If for some reason you
# want to use an older version, remove the "-o"s from the command lines below.

if [ x"$OPHIS" = x ]; then
  OPHIS="ophis"
fi

if [ x`which $OPHIS` = x ]; then
  echo "ERROR: Ophis executable '$OPHIS' not found"
  exit 1
fi

mkdir -p bin

# To make Bubble Escape 2K:
${OPHIS} "src/bubble escape 2k.oph" -o bin/be2k.prg
# now start Cruncher AB+
# Use 'A' and '-' to select AND #$00 for the de-pack effect, then
# select option 2: Fast Crunch in 64k of memory (max 111 blocks)
# Loadname: be2k.prg
# Savename: bubble escape 2k.prg
# Start JMP $C000
# Wait... then hit space to save

# To make Bubble Escape 8K:
${OPHIS} "src/bubble escape 8k.oph" -o bin/be8k.bin
# And then select "Attach generic 8K cartridge image" in VICE, and
# select be8k.bin

# To make the BASIC version:
tokenize() {
  if which hatoucan >/dev/null; then
    hatoucan -l 0801 <$1 >$2
  elif which petcat >/dev/null; then
    petcat -l 0801 -w2 -o $2 -- $1
  else
    echo 'ERROR: no suitable Commodore BASIC 2.0 tokenizer found'
    exit 1
  fi
}
TARGET="bubble escape"
tokenize "src/$TARGET.bas" "bin/$TARGET.prg" || exit $?
