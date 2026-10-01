build := "build"

build-image console="a10miniv4" screen="540P":
    ./scripts/build-image.sh "{{build}}" "{{console}}" "{{screen}}"

source build="build":
    ./scripts/source.sh "{{build}}"

clear:
    roms=$(sudo find /run/media/ -type d -name "EASYROMS")
    find "$roms" -maxdepth 1 -type d ! -name "$roms/tools" ! -name "$roms/themes" -exec rm -rf {} +

releases:
    ./scripts/releases.sh "{{build}}"

copy-configs:
    ./scripts/configs.sh
