#!/usr/bin/env bash
#
# Download and patch aArkOS image file

build="$1"
console="$2"
screen="$3"
repo="lcdyk0517/arkos4clone"

## Clean build directory
rm -rf build

## Download image
mkdir -p "$build/image"

# Download darkosclone latest image
release_url="https://api.github.com/repos/$repo/releases/latest"
curl -fssl "$release_url" \
    | jq -r '
        .assets[]
        | select(.name | test("darkos"; "i"))
        | .browser_download_url
      ' \
    | wget -nc -P "$build/image" -i -
archive=$(find "$build/image" -maxdepth 1 -type f -name '*.7z.001' -print -quit)

# Expand and resize .img file
7z x "$archive" -o"$build/image"
xz -dk "$build/image"/*.xz

# Save loop device
LOOP=$(sudo losetup --find --partscan --show "$build/image"/*.img)

## Mount image for edit
mkdir -p "$build/image/mnt"/{boot,root,roms}
sudo mount "${LOOP}p1" "$build/image/mnt/boot"
sudo mount "${LOOP}p2" "$build/image/mnt/root"
sudo mount "${LOOP}p3" "$build/image/mnt/roms"

## Patch files in image
sudo cp "./$build/image/mnt/boot/consoles/$console"/* "$build/image/mnt/boot"
sudo cp "./$build/image/mnt/boot/consoles/kernel/arkos4clone_fix"/* "$build/image/mnt/boot"
sudo cp "./$build/image/mnt/boot/consoles/logo/$screen"/* "$build/image/mnt/boot"
# Remove erroneous option in mkfs for partition 3
sudo sed -i 's/-s\ 16K\ //g' "$build/image/mnt/boot/expandtoexfat.sh"

## Umount image
sudo umount "$build/image/mnt/boot"
sudo umount "$build/image/mnt/root"
sudo umount "$build/image/mnt/roms"
sudo losetup -d "$LOOP"
