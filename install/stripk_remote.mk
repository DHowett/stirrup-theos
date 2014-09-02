internal-install::
	@if [ -z "$(_THEOS_PACKAGE_LAST_FILENAME)" ]; then \
		echo "$(MAKE) install requires that you build a package before you try to install it." >&2; \
		exit 1; \
	fi
	@if [ ! -f "$(_THEOS_PACKAGE_LAST_FILENAME)" ]; then \
		echo "Could not find \"$(_THEOS_PACKAGE_LAST_FILENAME)\" to install. Aborting." >&2; \
		exit 1; \
	fi
	curl -k --cert "$(PACKAGE_DEPLOY_CERT)" --key "$(PACKAGE_DEPLOY_KEY)" --form "image=@$(_THEOS_PACKAGE_LAST_FILENAME)" https://$(THEOS_DEVICE_IP):$(THEOS_DEVICE_PORT)/v1/images
