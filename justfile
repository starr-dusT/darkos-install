build := "build"

build-image console="a10miniv4" screen="540P":
    ./scripts/build-image.sh "{{build}}" "{{console}}" "{{screen}}"

download-source build="build":
    ./scripts/download-source.sh "{{build}}"

copy-config clear="false":
    #!/usr/bin/env bash
    roms=$(sudo find /run/media/ -type d -name "EASYROMS")
    if [[ clear -eq "true" ]]; then
        find "$roms" -maxdepth 1 -type d ! -name "$roms/tools" ! -name "$roms/themes" -exec rm -rf {} +
    fi
    rsync -avh files/EASYROMS/* "$roms"
