#!/usr/bin/env bash
#
# Download source for arkos4clone and Grout-ArkOS

build="$1"

# Clean directories
rm -rf "$build/arkos4clone"
rm -rf "$build/Grout"

# Download latest arkos4clone source
tag=$(curl -fsSL \
    https://api.github.com/repos/lcdyk0517/arkos4clone/releases/latest \
    | jq -r .tag_name)
mkdir -p "$build/arkos4clone"
curl -fL \
    "https://github.com/lcdyk0517/arkos4clone/archive/refs/tags/$tag.tar.gz" \
    | tar -xz --strip-components=1 -C "$build/arkos4clone"

# Download latest Grout-ArkOS.zip
grout_url=$(
    curl -fsSL \
        https://api.github.com/repos/rommapp/grout/releases/latest \
        | jq -r '.assets[] | select(.name == "Grout-ArkOS.zip") | .browser_download_url'
)
curl -fL "$grout_url" \
    -o "$build/Grout-ArkOS.zip"
unzip -q "$build/Grout-ArkOS.zip" -d "$build/Grout"
