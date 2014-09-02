ifeq ($(_THEOS_PACKAGE_FORMAT_LOADED),)
include $(THEOS_MAKE_PATH)/package/deb.mk

_THEOS_DEB_HAS_STIRRUP_SIGNIMAGE = $(call __executable,signimage)
ifneq ($(_THEOS_DEB_HAS_STIRRUP_SIGNIMAGE),$(_THEOS_TRUE))
internal-package-check::
	@echo "$(MAKE) package requires stirrup signimage."; exit 1
endif

ifeq ($(_THEOS_DEB_CAN_PACKAGE),$(_THEOS_TRUE)) # Control file found (or layout/ found.)
override _THEOS_DEB_PACKAGE_FILENAME = $(THEOS_PACKAGE_DIR)/$(THEOS_PACKAGE_NAME)_$(_THEOS_INTERNAL_PACKAGE_VERSION)_$(THEOS_PACKAGE_ARCH).ipk
override _THEOS_SIGNED_PACKAGE_FILENAME = $(THEOS_PACKAGE_DIR)/$(THEOS_PACKAGE_NAME)_$(_THEOS_INTERNAL_PACKAGE_VERSION)_$(THEOS_PACKAGE_ARCH).stripk
internal-package::
	$(ECHO_NOTHING)signimage -key=$(PACKAGE_SIGNING_KEY) -cert=$(PACKAGE_SIGNING_CERT) -mime=application/x-opkg -out="$(_THEOS_SIGNED_PACKAGE_FILENAME)" "$(_THEOS_DEB_PACKAGE_FILENAME)"$(ECHO_END)
	$(ECHO_NOTHING)rm "$(_THEOS_DEB_PACKAGE_FILENAME)"$(ECHO_END)

# This variable is used in package.mk
after-package:: override __THEOS_LAST_PACKAGE_FILENAME = $(_THEOS_SIGNED_PACKAGE_FILENAME)

endif # _THEOS_DEB_CAN_PACKAGE
endif # _THEOS_PACKAGE_FORMAT_LOADED
