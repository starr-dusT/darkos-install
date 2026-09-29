# dArkOS Build

Build dArkOS with my configs for my devices.

## Usage

1. Download and build image for initial install
```
just build # Default is for the a10miniv4
```
2. Burn image to sd card with Gnome Disks or similiar

3. Insert into console, boot, and allow initial install to complete

4. Shutdown console and reinsert sd card into computer

5. Run post install commands to install configs
```
just config /dev/
```
