#!/bin/bash
# shellcheck disable=SC2086,2103,2164

cd "$(dirname "$0")"

current_ver=$(head -1 debian/changelog | grep -Eo '[0-9]+(\.[0-9]+){2,}')

# Create .orig tarball
tar -cJf ../grub-theme-blissos_${current_ver}.orig.tar.xz .

dpkg-buildpackage -b --no-sign
