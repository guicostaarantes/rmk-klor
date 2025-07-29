# Firmware for the [Klor](https://github.com/GEIGEIGEIST/KLOR) keyboard using [RMK](https://github.com/haobogu/rmk) 

This project was started with `rmkit init` following RMK docs.

I then changed the keyboard matrix and pin layout to match Klor.

## How to use

1. Configure your keyboard preferences by editing `keyboard.toml`.
2. Configure your keyboard layout by editing `vial.json`.
3. When ready, run `docker build -t rmk-klor . && docker rm rmk-klor; rm -rf ./out && docker run -d --name rmk-klor rmk-klor && sleep 2 && docker cp rmk-klor:/out ./out` to build and copy the UF2 files to your filesystem.
4. Connect the board to the PC, enter bootloader mode, then run `mkdir -p mnt && sudo mount $(lsblk -Sno path,model | grep -F 'nRF UF2' | cut -d' ' -f1) mnt && sudo cp out/FILENAME.uf2 mnt` where `FILENAME` is replaced with the respective half that is being flashed.
