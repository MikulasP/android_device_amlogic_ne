#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Set kernel version for use in inherited makefiles
TARGET_KERNEL_VERSION := 5.4

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

## Attestation
PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

PRODUCT_COPY_FILES +=  \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

## Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio@7.0-util.vendor \
    android.hardware.audio.common@7.0-util \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@7.0-util.vendor \
    av-types-aidl-cpp.vendor \
    libaudioclient_aidl_conversion_util.vendor \
    libaudiofoundation.vendor

## Bluetooth
ifneq ($(BOARD_HAVE_BLUETOOTH),false)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor
endif

## Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-legacy \
    android.hardware.camera.provider@2.5-legacy \
    android.hardware.camera.provider@2.5-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    camera.device@3.3-impl \
    camera.device@3.4-impl \
    camera.device@3.5-impl

## Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

ifneq ($(PRODUCT_USE_SW_OMX),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif

## dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1.vendor

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2020-03-01.xml

## Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1.vendor

# Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.bluetooth.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.bluetooth.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.media.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.media.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi.rc \
    $(LOCAL_PATH)/init-files/init.recovery.amlogic.rc:recovery/root/init.recovery.amlogic.rc \
    $(LOCAL_PATH)/init-files/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

PRODUCT_PACKAGES += \
    fstab.amlogic

## Kernel Modules
PRODUCT_PACKAGES += \
    mali \
    media \
    optee-module

## Keymaster
ifneq ($(TARGET_HAS_TEE),false)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    android.hardware.security.secureclock-V1-ndk_platform.vendor \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor \
    lib_android_keymaster_keymint_utils.vendor \
    libkeymint.vendor \
    libkeymaster_messages.vendor \
    libkeymaster_portable.vendor \
    libpuresoftkeymasterdevice.vendor \
    libshmemutil.vendor \
    libshmemcompat.vendor \
    libsoft_attestation_cert.vendor \
    libtrusty.vendor
endif

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-V1-ndk_platform.vendor

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-V1-ndk_platform.vendor

## OEM Lock
PRODUCT_PACKAGES += \
    android.hardware.oemlock@1.0.vendor

## Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

## Platform
TARGET_AMLOGIC_SOC ?= s4

## Power
PRODUCT_PACKAGES += \
    android.hardware.power-V2-ndk_platform.vendor

## Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

## Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    android.hardware.boot@1.2 \
    android.hardware.boot@1.2.vendor

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    libhardware.recovery

## USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.2.vendor

## Inherit from the main common tree product makefile
$(call inherit-product, device/amlogic/common/amlogic.mk)

## Inherit from the common proprietary files makefile
$(call inherit-product, vendor/amlogic/ne/ne.mk)
