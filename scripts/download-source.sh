#!/usr/bin/env bash
#
# Download source for arkos4clone

build="$1"

tag=$(curl -fsSL https://api.github.com/repos/lcdyk0517/arkos4clone/releases/latest | jq -r .tag_name)
mkdir -p "$build/arkos4clone"
curl -L "https://github.com/lcdyk0517/arkos4clone/archive/refs/tags/$tag.tar.gz" \
    | tar -xz --strip-components=1 -C "$build/arkos4clone"
