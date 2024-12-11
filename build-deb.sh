#!/bin/bash
# shellcheck disable=SC2086,2103,2164

cd "$(dirname "$0")"

pkgname=grub-theme-blissos
pkgver=$(head -1 debian/changelog | grep -Eo '[0-9]+(\.[0-9]+){2,}')

# Create .orig tarball
tar -cJf ../${pkgname}_${pkgver}.orig.tar.xz .

dpkg-buildpackage -b --no-sign

THEME_VARIANTS=('vimix' 'tela' 'stylish' 'whitesur')
ICON_VARIANTS=('white' 'color' 'whitesur')
SCREEN_VARIANTS=('1080p' '2k' '4k' 'ultrawide' 'ultrawide2k')

# export metadata
cat <<EOF >../metadata.yml
Name: $pkgname
Version: $pkgver
Variants: $(for theme in "${THEME_VARIANTS[@]}"; do
  for icon in "${ICON_VARIANTS[@]}"; do
    for res in "${SCREEN_VARIANTS[@]}"; do
      echo -n " ${theme}-${icon}-${res}"
    done
  done
done)
EOF
