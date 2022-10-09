#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common RiceDroid stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

RICE_MAINTAINER := A³-Project
RICE_CHIPSET := MSM8953
RICE_PACKAGE_TYPE := AOSP
SUSHI_BOOTANIMATION := 720
TARGET_BUILD_GRAPHENEOS_CAMERA := true
TARGET_ENABLE_BLUR := false
TARGET_HAS_UDFPS := false
TARGET_KERNEL_OPTIONAL_LD := true
TARGET_USE_PIXEL_FINGERPRINT := false
WITH_GMS := true
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_FACE_UNLOCK_SUPPORTED := false
TARGET_OPTOUT_GOOGLE_TELEPHONY := false

# Inherit from rosy device
$(call inherit-product, device/xiaomi/rosy/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_rosy
PRODUCT_DEVICE := rosy
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 5
PRODUCT_MANUFACTURER := Xiaomi

# Bootanimation
TARGET_BOOTANIMATION_NAME := 720
TARGET_BOOT_ANIMATION_RES := 720
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := rosy

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="rosy-user 7.1.2 N2G47H V9.2.3.0.NDAMIEK release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "Xiaomi/rosy/rosy:7.1.2/N2G47H/V9.2.3.0.NDAMIEK:user/release-keys"

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# memory management [2]
persist.sys.fw.bg_apps_limit=96

# Adapted LMKD [1] & [2]
# kill_heaviest_task_dup
ro.lmk.kill_heaviest_task=true
# kill_timeout_ms_dup
ro.lmk.kill_timeout_ms=100
# thrashing_threshold
ro.lmk.thrashing_limit=30
# thrashing_decay
ro.lmk.thrashing_limit_decay=5
# nstrat_low_swap
ro.lmk.swap_free_low_percentage=10
# nstrat_psi_partial_ms
ro.lmk.psi_partial_stall_ms=70
# nstrat_psi_complete_ms
ro.lmk.psi_complete_stall_ms=70
# use_new_strategy_dup
ro.lmk.use_new_strategy=true
# CLO lmkd [1] - others were not defined (will use default values from lmkd binary)
ro.lmk.psi_scrit_complete_stall_ms=75
ro.lmk.nstrat_wmark_boost_factor=4
ro.lmk.enable_watermark_check=true
ro.lmk.enable_userspace_lmk=true
ro.lmk.super_critical=701
ro.lmk.direct_reclaim_pressure=45
ro.lmk.reclaim_scan_threshold=0

# app compaction - [1] & [2]
# disabled app compaction due to app freezes when switching tasks
persist.sys.appcompact.enable_app_compact=false
persist.sys.appcompact.full_compact_type=2
persist.sys.appcompact.some_compact_type=4
persist.sys.appcompact.compact_throttle_somesome=5000
persist.sys.appcompact.compact_throttle_somefull=10000
persist.sys.appcompact.compact_throttle_fullsome=500
persist.sys.appcompact.compact_throttle_fullfull=10000
persist.sys.appcompact.compact_throttle_bfgs=600000
persist.sys.appcompact.compact_throttle_persistent=600000
persist.sys.appcompact.rss_throttle_kb=12000
persist.sys.appcompact.delta_rss_throttle_kb=8000
persist.sys.perf.topAppRenderThreadBoost.enable=false

# Memory properties
# Tune these properties according to device perfconfigstore.xml(if available)/device capabilities.
# These props are overridable
#PRODUCT_PRODUCT_PROPERTIES += \
#    persist.sys.fw.bg_apps_limit?=48 \
#    persist.sys.fw.use_trim_settings?=true \
#    persist.sys.fw.empty_app_percent?=50 \
#    persist.sys.fw.trim_empty_percent?=100 \
#    persist.sys.fw.trim_cache_percent?=100 \
#    persist.sys.fw.trim_enable_memory?=2147483648 \
#    persist.sys.fw.bservice_age?=120000 \
#    persist.sys.fw.bservice_limit?=6 \
#    persist.sys.fw.bservice_enable?=true
