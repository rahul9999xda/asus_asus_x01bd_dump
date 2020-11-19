#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:57496876:6c68c648cc1cd2b8b7f69f1385654bd8b834af39; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:51266856:f7bcd00b75529f9920022df80a8cde2421b0e449 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:57496876:6c68c648cc1cd2b8b7f69f1385654bd8b834af39 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
