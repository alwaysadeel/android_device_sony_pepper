# Architecture
TARGET_ARCH_LOWMEM := true
 
# Inherit from the proprietary version
-include vendor/sony/pepper/BoardConfigVendor.mk


# Inherit from the common montblanc definitions
-include device/sony/montblanc-common/BoardConfigCommon.mk


# Platform specific headers
TARGET_SPECIFIC_HEADER_PATH += device/sony/pepper/include


# Kernel specific configurations
TARGET_KERNEL_CONFIG := xperiasola_defconfig

BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_RECOVERY_FSTAB := device/sony/pepper/config/fstab.st-ericsson

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1
 
# Specific flag for LED bar notification
COMMON_GLOBAL_CFLAGS += -DNEW_NOTIFICATION


# Device identifiers for updates
TARGET_OTA_ASSERT_DEVICE := MT27i,MT27a,pepper
