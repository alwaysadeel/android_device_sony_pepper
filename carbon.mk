$(call inherit-product, device/sony/pepper/full_pepper.mk)

# Inherit Carbon common GSM stuff.
$(call inherit-product, vendor/carbon/config/common_gsm.mk)

# Inherit Carbon common Phone stuff.
$(call inherit-product, vendor/carbon/config/common_phone.mk)
 
# Boot Animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

PRODUCT_NAME := carbon_pepper
PRODUCT_DEVICE := pepper
