#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="RMX2020"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

# ofrp device
export FOX_TARGET_DEVICES="RMX2020,RMX2027"
export TARGET_DEVICE_ALT="RMX2020,RMX2027"

# ofrp settings
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_ALLOW_EARLY_SETTINGS_LOAD=1
export OF_FLASHLIGHT_ENABLE=0
export OF_ADVANCED_SECURITY=1

# ofrp decryption
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1

# ofrp ota
export OF_SUPPORT_OZIP_DECRYPTION=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

# ofrp gui
export OF_SCREEN_H=2400
export OF_STATUS_H=80
export OF_STATUS_INDENT_RIGHT=48
export OF_STATUS_INDENT_LEFT=48
export OF_CLOCK_POS=1
export OF_HIDE_NOTCH=1
export OF_DISABLE_EXTRA_ABOUT_PAGE=1
export OF_USE_LOCKSCREEN_BUTTON=1
export OF_USE_GREEN_LED=0
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_NO_SPLASH_CHANGE=1

# ofrp directory
export FOX_MISCELLANEOUS_ROOT_DIRECTORY="/sdcard/recovery"
export FOX_SETTINGS_ROOT_DIRECTORY="/persist/recovery"
export OF_QUICK_BACKUP_LIST="/nvram;/nvdata;/nvcfg;/protect_f;/protect_s;/proinfo;/oppo_custom;/md1img;"
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
export OF_DYNAMIC_FULL_SIZE=6685720576

# ofrp addons
export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
export FOX_ENABLE_KERNELSU_SUPPORT=1
export FOX_ENABLE_SUKISU_SUPPORT=1
export FOX_ENABLE_APP_MANAGER=0
export FOX_DELETE_INITD_ADDON=1
export FOX_DELETE_AROMAFM=1
export OF_ENABLE_ALL_PARTITION_TOOLS=1
export FOX_DELETE_MAGISK_ADDON=1
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_REPLACE_TOOLBOX_GETPROP=1

# ofrp shell
export FOX_USE_NANO_EDITOR=1
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1

# ofrp compression
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_XZ_UTILS=1

# ofrp maintainer
export OF_MAINTAINER="dantepaulxd"
export FOX_BUILD_TYPE="Stable"

# ofrp logging
export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1
export OF_DONT_KEEP_LOG_HISTORY=1

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
         export | grep "FOX" >> "$FOX_BUILD_LOG_FILE"
         export | grep "OF_" >> "$FOX_BUILD_LOG_FILE"
         export | grep "TARGET_" >> "$FOX_BUILD_LOG_FILE"
         export | grep "TW_" >> "$FOX_BUILD_LOG_FILE"
     fi
else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename "$0")"
    fi
fi

# end
