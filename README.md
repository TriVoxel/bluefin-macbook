# Bluefin for MacBooks

## Purpose

This custom image is just stock Bluefin Stable in addition to Broadcom-wl drivers to support the obscure Broadcom WiFi cards found in these devices. For anyone not using a MacBook from the twenty-teens, just use [https://projectbluefin.io](the regular release). Hope this helps someone!

Includes:

- `broadcom-wl`
- `kmod-wl`
- `akmods-wl`

## How to install?

Please refer to [https://docs.projectbluefin.io/introduction/](the Bluefin docs) for complete installation instructions.

1. Download the latest ISO from this repository
2. Flash ISO to a USB drive
3. Insert USB into MacBook and hold <kbd>⌥/Option</kbd> (<kbd>Alt</kbd>) key while turning on
4. Select the USB drive from the boot screen
5. Install

If WiFi is not working, run the following commands:

```
sudo modprobe enable wl
sudo akmods
systemctl reboot
```

## Rebasing to this custom image

To be continued. This is a first draft!!
