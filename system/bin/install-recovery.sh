#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:55801132:eae0a82d806688dc057ced1bd48e341783096a09; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:51746088:9c15de39f0653b06bab6be475bb50af623ab370d EMMC:/dev/block/bootdevice/by-name/recovery eae0a82d806688dc057ced1bd48e341783096a09 55801132 9c15de39f0653b06bab6be475bb50af623ab370d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
