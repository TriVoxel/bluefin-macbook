# Bluefin for MacBooks

## Purpose

This is an unofficial custom image. It is just stock Bluefin Stable in addition to Broadcom-wl drivers to support the obscure Broadcom WiFi cards found in these devices. For anyone not using a MacBook from the twenty-teens, just use [the regular release](https://projectbluefin.io). Hope this helps someone!

Includes:

- `broadcom-wl`
- `kmod-wl`
- `akmods-wl`

## How to install?

Please refer to [the Bluefin docs](https://docs.projectbluefin.io/introduction/) for complete installation instructions.

1. Download the latest ISO from this repository
2. Flash ISO to a USB drive
3. Insert USB into MacBook and hold <kbd>⌥/Option</kbd> (<kbd>Alt</kbd>) key while turning on
4. Select the USB drive from the boot screen
5. Install

## Rebasing to this custom image

To be continued. This is a first draft!!

## Troubleshooting

If WiFi is not working, run the following commands:

```
sudo modprobe enable wl
sudo akmods
systemctl reboot
```
