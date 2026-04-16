#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/calyx/config/common_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/barbet/aosp_barbet.mk)
$(call inherit-product, device/google/redbull/lineage_common.mk)

include device/google/barbet/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 5a
PRODUCT_NAME := calyx_barbet

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="barbet-user 14 AP2A.240805.005.S4 12281092 release-keys" \
    BuildFingerprint=google/barbet/barbet:14/AP2A.240805.005.S4/12281092:user/release-keys \
    DeviceProduct=barbet

PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, vendor/google/barbet/barbet-vendor.mk)
