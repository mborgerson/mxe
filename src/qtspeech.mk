# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtspeech
$(PKG)_WEBSITE   = $(qtbase_WEBSITE)
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 090125ce13c4219c7e2291e7a248c0923fd8534f0667fabd544ca377e9a8b305
$(PKG)_SUBDIR    = $(subst qtbase,qtspeech,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtspeech,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtspeech,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake' '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
endef
