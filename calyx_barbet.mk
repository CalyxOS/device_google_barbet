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

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=barbet \
    PRIVATE_BUILD_DESC="barbet-user 12 SQ3A.220705.003.A1 8672226 release-keys"

BUILD_FINGERPRINT := google/barbet/barbet:12/SQ3A.220705.003.A1/8672226:user/release-keys

PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, vendor/google/barbet/barbet-vendor.mk)
