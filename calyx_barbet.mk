# Inherit some common stuff.
$(call inherit-product, vendor/calyx/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/barbet/device-calyx.mk)
$(call inherit-product, device/google/redbull/device-calyx.mk)
$(call inherit-product, device/google/barbet/aosp_barbet.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := calyx_barbet
PRODUCT_MODEL := Pixel 5a
PRODUCT_BRAND := google

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_SOONG_NAMESPACES += vendor/google_devices/barbet
