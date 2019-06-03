# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Ramdisk Cleaner X00TD by shanu
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=ASUS_X00TD
device.name2=X00TD
device.name3=X00T
device.name4=XOOTD
device.name5=XOOT
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/platform/omap/omap_hsmmc.0/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;
chmod -R 755 $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# backup of init.rc file
backup_file init.rc;

# remove import statement line from the init.rc file
remove_line init.rc "import /init.PbH.rc"
remove_line init.rc "import /init.Pbh.rc"
remove_line init.rc "import /init.azure.rc"
remove_line init.rc "import /init.boost.rc"
remove_line init.rc "import /init.darkonah.rc"
remove_line init.rc "import /init.overdose.rc"
remove_line init.rc "import /init.pk.rc"
remove_line init.rc "import /init.spectrum.rc"
remove_line init.rc "import /init.stardust.rc"
remove_line init.rc "import /init.thundercloud.rc"
remove_line init.rc "import /init.trb.rc"

# delete init import files files from ramdisk
rm -rfv $ramdisk/init.PbH.rc;
rm -rfv $ramdisk/init.Pbh.rc;
rm -rfv $ramdisk/init.azure.rc;
rm -rfv $ramdisk/init.boost.rc;
rm -rfv $ramdisk/init.darkonah.rc;
rm -rfv $ramdisk/init.overdose.rc;
rm -rfv $ramdisk/init.pk.rc;
rm -rfv $ramdisk/init.special_power.sh;
rm -rfv $ramdisk/init.spectrum.rc;
rm -rfv $ramdisk/init.spectrum.sh;
rm -rfv $ramdisk/init.thundercloud.rc;
rm -rfv $ramdisk/init.thundercloud.sh;
rm -rfv $ramdisk/init.trb.rc;

# end ramdisk changes

write_boot;
## end install

