#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_HARDWARE := barbet

ifeq ($(TARGET_PREBUILT_KERNEL),)
    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
        LOCAL_KERNEL := device/google/barbet-kernel/Image.lz4
    else
        LOCAL_KERNEL := device/google/barbet-kernel/vintf/Image.lz4
    endif
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_VENDOR_KERNEL_HEADERS := device/google/barbet-kernel/sm7250/kernel-headers

include build/make/target/product/iorap_large_memory_config.mk
include device/google/redbull/device-common.mk

# LOCAL_PATH is device/google/redbull before this
LOCAL_PATH := device/google/barbet

PRODUCT_SOONG_NAMESPACES += \
    device/google/barbet

DEVICE_PACKAGE_OVERLAYS += device/google/barbet/barbet/overlay

# Audio XMLs for barbet

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_bolero_snd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_bolero_snd.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_bolero_snd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_bolero_snd.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/tas2562/tas25xx_TI_0.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/tas25xx_TI_0.bin \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Audio ACDB data
ifeq ($(wildcard vendor/google_cei/factory/prebuilt/ftm.mk),)
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/audio/acdbdata/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Bluetooth_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/General_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Global_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Handset_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Hdmi_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Headset_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Speaker_cal.acdb \
     $(LOCAL_PATH)/audio/acdbdata/adsp_avs_config.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/adsp_avs_config.acdb

# Audio ACDB workspace files for QACT
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/audio/acdbdata/workspaceFile.qwsp:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/workspaceFile.qwsp
endif
endif

# Calibration Tools for factory
ifneq ($(wildcard vendor/google_cei/factory/prebuilt/ftm.mk),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/tas2562/calib.config:$(TARGET_COPY_OUT_VENDOR)/etc/calib.config \
    $(LOCAL_PATH)/audio/tas2562/PinkNoise_m22db_RmsPow.wav:$(TARGET_COPY_OUT_VENDOR)/etc/PinkNoise_m22db_RmsPow.wav \
    $(LOCAL_PATH)/audio/tas2562/Silence.wav:$(TARGET_COPY_OUT_VENDOR)/etc/Silence.wav \
    $(LOCAL_PATH)/audio/tas2562/TAS_FactoryApp:$(TARGET_COPY_OUT_VENDOR)/bin/TAS_FactoryApp
endif

ifeq ($(wildcard vendor/google_devices/barbet/proprietary/device-vendor-barbet.mk),)
    BUILD_WITHOUT_VENDOR := true
endif

PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service.barbet

# Vibrator HAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.barbet

# DRV2624 Haptics Waveform
PRODUCT_COPY_FILES += \
    device/google/barbet/vibrator/drv2624/drv2624.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/drv2624.bin

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vibrator.hal.config.dynamic=1 \
    ro.vibrator.hal.click.duration=7 \
    ro.vibrator.hal.tick.duration=7 \
    ro.vibrator.hal.heavyclick.duration=7 \
    ro.vibrator.hal.short.voltage=161 \
    ro.vibrator.hal.long.voltage=161 \
    ro.vibrator.hal.long.frequency.shift=10 \
    ro.vibrator.hal.steady.shape=1 \
    ro.vibrator.hal.lptrigger=0


# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service.barbet

#per device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/barbet/init.barbet.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.barbet.rc

# insmod files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.insmod.barbet.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.barbet.cfg

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.device.rc:recovery/root/init.recovery.barbet.rc

PRODUCT_PACKAGES += \
    sensors.$(PRODUCT_HARDWARE) \

# Thermal HAL config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal_info_config_$(PRODUCT_HARDWARE).json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Support to disable thermal protection at run time
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/init.hardware.chamber.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_HARDWARE).chamber.rc
endif

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvoiceprocessingdescriptors

# Fingerprint HIDL
include device/google/barbet/fingerprint.mk

# NFC
PRODUCT_COPY_FILES += \
    device/google/barbet/nfc/libnfc-hal-st-G6QU3.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st-G6QU3.conf

# Bluetooth Tx power caps for barbet
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G6QU3.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025E.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025E_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025I_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025H_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025I.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025E_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025I_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025H_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025H.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025E_JP.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025I_JP.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_barbet_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G025H_JP.csv

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayG025H
