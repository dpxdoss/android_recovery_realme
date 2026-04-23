#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from TWRP config
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/realme/RMX2020/device.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

PRODUCT_DEVICE := RMX2020
PRODUCT_NAME := fox_RMX2020
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX2020
PRODUCT_MANUFACTURER := realme

TW_DEVICE_VERSION := OrangeFox for RealmeUI 2.0

PRODUCT_SHIPPING_API_LEVEL := 29

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# OrangeFox-specific exports
export OF_MAINTAINER="Dante"
export OF_SUPPORT_OZIP_DECRYPTION=1
export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
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
export OF_OPTIONS_LIST_NUM=8
export OF_DEFAULT_TIMEZONE="GMT-5:30"
export OF_ENABLE_ALL_PARTITION_TOOLS=1
export OF_FLASHLIGHT_ENABLE=0
export OF_ADVANCED_SECURITY=1
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
export OF_QUICK_BACKUP_LIST="/nvram;/nvdata;/nvcfg;/protect_f;/protect_s;/proinfo;/oppo_custom;/md1img;"
export OF_DYNAMIC_FULL_SIZE=6685720576
export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1
export OF_DONT_KEEP_LOG_HISTORY=1
