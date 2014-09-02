# Theos Stirrup Module

## Installation

* `git clone https://github.com/DHowett/stirrup-theos $THEOS/mod/stirrup`
* Get a copy of stirrup signimage, place it in `$THEOS/bin`

## Usage

### Makefile

```make
export MODULES=stirrup
export PACKAGE_FORMAT=stripk
export PACKAGE_SIGNING_KEY=private.key.pem
export PACKAGE_SIGNING_CERT=certificate.crt

include theos/makefiles/common.mk
```
