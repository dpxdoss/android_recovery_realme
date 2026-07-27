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
FOX_BUILD_DEVICE="RMX2020"
# additional orangefox zip installer device
export TARGET_DEVICE_ALT="RMX2020, RMX2027"
# additional roms zip installer support
export FOX_TARGET_DEVICES="RMX2020,RMX2027"
# Initial Build Setup
export LC_ALL="C"
export ALLOW_MISSING_DEPENDENCIES=true
# Maintainer Info
export OF_MAINTAINER="Dante TG@dantepaulxd"
export FOX_BUILD_TYPE="Beta"
export FOX_VARIANT="12.1"
# Directory Info
export FOX_SETTINGS_ROOT_DIRECTORY=/persist
export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
export OF_QUICK_BACKUP_LIST="/nvram;/nvdata;/nvcfg;/protect_f;/protect_s;/proinfo;/oppo_custom;/md1img;"
export OF_DYNAMIC_FULL_SIZE=6685720576
# Addon Patches
export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
export FOX_ENABLE_SUKISU_SUPPORT=1
export FOX_ENABLE_APP_MANAGER=0
export FOX_DELETE_INITD_ADDON=1
export FOX_DELETE_AROMAFM=1
	# Magisk
	function download_magisk(){
		# Usage: download_magisk <destination_path>
		local DEST=$1
		if [ -n "${DEST}" ]; then
			if [ ! -e ${DEST} ]; then
				echo "Downloading the Latest Release of Magisk..."
				local LATEST_MAGISK_URL=$(curl -sL https://api.github.com/repos/topjohnwu/Magisk/releases/latest | grep browser_download_url | grep Magisk- | cut -d : -f 2,3 | tr -d '"')
				mkdir -p $(dirname ${DEST})
				wget -q ${LATEST_MAGISK_URL} -O ${DEST} || wget ${LATEST_MAGISK_URL} -O ${DEST}
				local RCODE=$?
				if [ "$RCODE" = "0" ]; then
					echo "Successfully Downloaded Magisk to ${DEST}!"
					echo "Done!"
				else
					echo "Failed to Download Magisk to ${DEST}!"
				fi
			fi
		fi
	}
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk.zip
download_magisk $FOX_USE_SPECIFIC_MAGISK_ZIP
export FOX_USE_UPDATED_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_PATCH_AVB20=1

export FOX_REPLACE_TOOLBOX_GETPROP=1
# Shell Patches
export FOX_USE_NANO_EDITOR=1
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
# Settings Config
export FOX_ALLOW_EARLY_SETTINGS_LOAD=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_ENABLE_ALL_PARTITION_TOOLS=1
export OF_ADVANCED_SECURITY=1
export OF_DISABLE_EXTRA_ABOUT_PAGE=1
export OF_USE_LOCKSCREEN_BUTTON=1
export OF_USE_GREEN_LED=0
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_SPLASH_MAX_SIZE=130
export OF_OPTIONS_LIST_NUM=8
export OF_DEFAULT_TIMEZONE="GMT-5:30"
export OF_FLASHLIGHT_ENABLE=0
# Binary Patches
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_ZSTD_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_XZ_UTILS=1
# Additional OTA support
export OF_SUPPORT_OZIP_DECRYPTION=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
# Orangefox Configs
export OF_SCREEN_H=2400
export OF_STATUS_H=80
export OF_STATUS_INDENT_RIGHT=48
export OF_STATUS_INDENT_LEFT=48
export OF_CLOCK_POS=1
export OF_HIDE_NOTCH=1
# Decryption Helper
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1
export OF_DONT_KEEP_LOG_HISTORY=1
