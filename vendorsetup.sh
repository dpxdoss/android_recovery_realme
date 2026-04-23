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

# ofrp device
FDEVICE="RMX2020"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

export TARGET_DEVICE_ALT="RMX2027"
export FOX_TARGET_DEVICES="RMX2020,RMX2027"

# Initial Info
export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true

# Maintainer Info
export FOX_BUILD_TYPE="Beta"
export FOX_VARIANT="12.1"

# Directory Info
export FOX_SETTINGS_ROOT_DIRECTORY=/persist
export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

# Addon Patches
export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
export FOX_ENABLE_KERNELSU_SUPPORT=1
export FOX_ENABLE_SUKISU_SUPPORT=1
export FOX_ENABLE_APP_MANAGER=0
export FOX_DELETE_INITD_ADDON=1
export FOX_DELETE_AROMAFM=1
export FOX_DELETE_MAGISK_ADDON=1
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_REPLACE_TOOLBOX_GETPROP=1

# Shell Patches
export FOX_USE_NANO_EDITOR=1
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1

# Other Patches
export FOX_ALLOW_EARLY_SETTINGS_LOAD=1

# Binary Patches
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_XZ_UTILS=1

	# let's see what are our build VARs
if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi

# end
