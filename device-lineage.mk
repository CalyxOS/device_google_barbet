#
# Copyright (C) 2021 The LineageOS Project
# Copyright (C) 2021 The Calyx Institute
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/google/redbull/device-lineage.mk)

# CHRE
$(call soong_config_set,chre,chre_daemon_dsp_library,//vendor/google/barbet:libadsprpc)

# Google Camera
PRODUCT_COPY_FILES += \
    device/google/barbet/sysconfig/the_experiences.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/the_experiences.xml

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlay
