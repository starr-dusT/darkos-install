# dArkOS Install

Instructions and configs for dArkOS install on my devices. Primarily the A10mini V4.

## Install

1. Download latest dArkOS4Clone release from [here](https://github.com/lcdyk0517/arkos4clone/releases)

2. Extract multi-part archive to the image file with the following commands:
```
7z x <first archive file>
xz -dk <combined archive>   
```

3. Flash dArkOS4Clone image to sd card with Gnome Disks or similar

4. Copy the following to the root of the BOOT partition:
    - Contents of `consoles/<console>`
    - Kernel from `consoles/kernel/arkos4clone_fix`
    - Logo file from `consoles/logo/<resolution>` (540P for A10mini V4)
    
4. Put SD card into handheld and perform initial installation. Then remove and put back into computer

5. Download latest Grout release for dArkOS from [here](https://github.com/rommapp/grout/releases). Extract the contents to `EASYROMS/ports`. Copy the `input_mappings.json` to the `Grout` folder to fix mappings for Grout setup.

6. Copy over theme files from `files/themes` to `EASYROMS/themes` and remove all folders from `EASYROMS` except for:
    - `tools`
    - `themes`
    - `ports`
    - `launchimages`

7. Put SD card back into device and boot

8. Connect console to Wifi and perform initial setup of Grout. Create token for console [here](https://romm.tstarr.us/client-api-tokens). When prompted create directories for relevant systems. Make sure to register device for save sync in `Settings -> Save Sync`.

9. Open Retroarch and adjust save settings: `Settings -> Saving -> Sort Saves into Folders by Core Name -> OFF` then save with `ArkOS -> Configuration File -> Save Current Configuration`

10. Set misc settings:
    - `UI Settings -> Select desired theme`
    - `ArkOS4Clone Settings -> Power LED -> Above 60% Blue`
    - `Advanced Settings -> Timezone -> America/Los_Angeles`
    
11. Download roms and bios files with Grout

12. Scrape Artwork with Scraper:
    - `Scraper -> Username`
    - `Scraper -> Password`
    - `Scraper -> Scrape Now -> Start`
        
13. Enjoy!
