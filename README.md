# Theos Stirrup Module

## Installation

* `git clone https://github.com/DHowett/stirrup-theos $THEOS/mod/stirrup`
* Get a copy of stirrup signimage, place it in `$THEOS/bin`

## Usage

### Makefile

```make
export TARGET  = stirrup
export MODULES = stirrup
export PACKAGE_SIGNING_KEY  = signing.key.pem
export PACKAGE_SIGNING_CERT = signing.crt
export PACKAGE_DEPLOY_KEY   = deploy.key.pem
export PACKAGE_DEPLOY_CERT  = deploy.crt

include theos/makefiles/common.mk
```
