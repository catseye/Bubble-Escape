#!/bin/sh

# This script assumes you have Ophis version 2.0.  If for some reason you
# want to use an older version, remove the "-o"s from the command lines below.
OPHIS="ophis"

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
