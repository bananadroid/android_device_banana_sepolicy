#
# This policy configuration will be used by all products that
# inherit from BananaDroid
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/banana/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/banana/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/banana/sepolicy/common/dynamic \
    device/banana/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/banana/sepolicy/common/dynamic \
    device/banana/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/banana/sepolicy/legacy-common/sepolicy.mk
