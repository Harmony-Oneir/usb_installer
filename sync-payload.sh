#!/bin/bash
# Копирует свежие артефакты сборки OHOS в live-систему установщика.
set -euo pipefail
cd "$(dirname "$0")/../.."          # корень исходников OHOS

DST=oneir/installer/live/config/includes.chroot_after_packages/opt/ohos
rm -rf "$DST"
mkdir -p "$DST"

cp -r oneir/installer/esp       "$DST/esp"
cp -r oneir/installer/repart.d  "$DST/repart.d"
cp    oneir/installer/cmdline.txt "$DST/cmdline.txt"
cp    out/kernel/OBJ/linux-6.6/arch/x86/boot/bzImage "$DST/bzImage"
cp --sparse=always out/oneir/ohos-root.img out/oneir/userdata.img "$DST/"

echo "Payload:"
ls -la "$DST" "$DST/esp/EFI/BOOT"
