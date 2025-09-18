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
dnf5 versionlock delete kernel kernel-devel kernel-devel-matched kernel-core kernel-modules kernel-modules-core kernel-modules-extra
dnf5 remove -y kernel kernel-core kernel-devel kernel-devel-matched kernel-modules kernel-modules-core kernel-modules-extra
dnf5 install -y /tmp/akmods-rpms/kmods/*wl*.rpm /tmp/akmods-kernel-rpms/kernel*.rpm
dnf5 install -y add-determinism annobin-docs annobin-plugin-gcc ansible-srpm-macros build-reproducibility-srpm-macros debugedit dwz ed efi-srpm-macros elfutils fakeroot fakeroot-libs filesystem-srpm-macros fonts-srpm-macros forge-srpm-macros fpc-srpm-macros gcc-plugin-annobin gdb-minimal ghc-srpm-macros gnat-srpm-macros go-srpm-macros grubby ima-evm-utils-libs kernel-srpm-macros libfsverity libklvanc lua-srpm-macros ocaml-srpm-macros openblas-srpm-macros package-notes-srpm-macros patch perl-srpm-macros pyproject-srpm-macros python-srpm-macros python3-anyio python3-certifi python3-h11 python3-httpcore python3-httpx python3-progressbar2 python3-rpm python3-rpmautospec python3-rpmautospec-core python3-sniffio python3-utils qt5-srpm-macros qt6-srpm-macros redhat-rpm-config rpm-build rpm-sign-libs rpmdevtools rust-srpm-macros tesseract-common tesseract-langpack-eng tesseract-tessdata-doc tree-sitter-srpm-macros zig-srpm-macros
echo wl > /etc/modprobe.d/wl.conf
