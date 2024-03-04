#
# Copyright (C) 2021 The Calyx Institute
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

# For Google Camera
PRODUCT_COPY_FILES += \
    device/google/barbet/the_experiences.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/the_experiences.xml

# HBM
PRODUCT_PACKAGES += \
    HbmSVManagerOverlay

# Nos
PRODUCT_PACKAGES += \
    libnos:64 \
    libnosprotos:64 \
    libnos_client_citadel:64 \
    libnos_datagram:64 \
    libnos_datagram_citadel:64 \
    libnos_feature:64 \
    libnos_transport:64 \
    nos_app_avb:64 \
    nos_app_identity:64 \
    nos_app_keymaster:64 \
    nos_app_keymaster_ctdl:64 \
    nos_app_weaver:64

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-V2-ndk.vendor:64
