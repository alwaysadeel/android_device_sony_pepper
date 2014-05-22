#
# Copyright (C) 2014 Android Open Source Project
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

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Inherit from the common montblanc definitions
$(call inherit-product, device/sony/montblanc-common/montblanc.mk)


# Inherit from the device specific vendor definitions
$(call inherit-product-if-exists, vendor/sony/pepper/pepper-vendor.mk)


# Device specific settings overlays
DEVICE_PACKAGE_OVERLAYS += device/sony/pepper/overlay


# Device specific headers
TARGET_SPECIFIC_HEADER_PATH += device/sony/pepper/include

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.google.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml 
 
# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml


# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/config/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/config/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml


# Device specific configuration scripts
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/config/fstab.st-ericsson:root/fstab.st-ericsson \
        $(LOCAL_PATH)/config/init.st-ericsson.device.rc:root/init.st-ericsson.device.rc \
        $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml


# Device specific hardware configuration scripts
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/config/dash.conf:system/etc/dash.conf \
        $(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh \
        $(LOCAL_PATH)/config/cflashlib.cfg:system/etc/cflashlib.cfg \
        $(LOCAL_PATH)/config/flashled_param_config.cfg:system/etc/flashled_param_config.cfg


# Device specific bootlogo and charging animation
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/logo-480x854.rle:root/logo.rle 
	
$(call inherit-product, $(LOCAL_PATH)/prebuilt/resources-480x854.mk)


# Device specific USB configuration script
PRODUCT_COPY_FILES += $(LOCAL_PATH)/config/init.st-ericsson.usb.rc:root/init.st-ericsson.usb.rc


# Device specific keylayouts and touchscreen configurations files
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/config/AB8500_Hs_Button.kl:system/usr/keylayout/AB8500_Hs_Button.kl \
        $(LOCAL_PATH)/config/cyttsp-spi.kl:system/usr/keylayout/cyttsp-spi.kl \
        $(LOCAL_PATH)/config/cyttsp-spi.idc:system/usr/idc/cyttsp-spi.idc \
        $(LOCAL_PATH)/config/so34-buttons.kl:system/usr/keylayout/so34-buttons.kl \
        $(LOCAL_PATH)/config/ux500-ske-keypad.kl:system/usr/keylayout/ux500-ske-keypad.kl \
        $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl \
        $(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl


# Device specific display resolutions
# Reference: http://developer.android.com/guide/practices/screens_support.html
# Note: In PRODUCT_AAPT_PREF_CONFIG set the proper one (e.g. hdpi), in PRODUCT_AAPT_CONFIG set the proper one and the previous one (e.g. mdpi)
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_CONFIG := mdpi hdpi


# Android kind of memory
PRODUCT_PROPERTY_OVERRIDES += ro.build.characteristics=nosdcard


# PC Companion kind of memory
PRODUCT_PROPERTY_OVERRIDES += ro.semc.product.user_storage=emmc_only


# NFC
PRODUCT_PROPERTY_OVERRIDES += \
        ro.nfc.on.default=false \
        ro.nfc.se.sim.enable=true \
        ro.nfc.se.smx.enable=false \
        ro.nfc.icon.enable=true \
        ro.nfc.vendor.name=nxp


# Hardware video codecs configuration
PRODUCT_PROPERTY_OVERRIDES += \
        ste.video.dec.mpeg4.in.size=8192 \
        ste.video.enc.out.buffercnt=5 \
        ste.video.dec.recycle.delay=1 \
        ste.video.decoder.max.hwmem=0x2600000 \
        ste.video.decoder.max.res=720p \
        ste.video.decoder.h264.max.lev=3.2


# Device specific proprieties
# References: 
# - http://source.android.com/devices/tuning.html
# - http://en.wikipedia.org/wiki/Pixel_density#Calculation_of_monitor_PPI
# - https://source.android.com/devices/low-ram.html
PRODUCT_PROPERTY_OVERRIDES += \
        ro.hwui.texture_cache_size=9 \
        ro.hwui.layer_cache_size=7 \
        ro.hwui.path_cache_size=2 \
        ro.sf.lcd_density=240 \
        ro.config.low_ram=true
