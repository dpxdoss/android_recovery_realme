#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2024-2026 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later

LOCAL_PATH := device/realme/RMX2020

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# some OrangeFox-specific settings
$(call inherit-product, $(LOCAL_PATH)/fox_RMX2020.mk)
#
