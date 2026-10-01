#!/usr/bin/env bash
#
# Copy files from release downloads to sd card

build="$1"

roms=$(sudo find /run/media/ -type d -name "EASYROMS")
rsync -avh "$build/Grout/*" "$roms/ports"
