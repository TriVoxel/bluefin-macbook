#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 config-manager addrepo -y --from-repofile=https://repo.secureblue.dev/secureblue.repo



# this installs a package from fedora repos
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y akmod-wl broadcom-wl kmod-wl
# /usr/sbin/akmods --force
cd /tmp/
akmodsbuild --force /usr/src/akmods/wl-kmod.latest
sudo rpm --force -i kmod-wl-$(uname -r)-*.rpm
rpm -q kmod-wl-$(uname -r)
rpm -V kmod-wl-$(uname -r)
sudo depmod -a
sudo modprobe wl
