include $(TOPDIR)/rules.mk

PKG_NAME:=mentohust
PKG_VERSION:=0.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/hexchain/mentohust-minimal.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=9725b027f8ec0f980e5f22f77d09a34d299c4bd2

PKG_MAINTAINER:=Hexchain Tong <i@hexchain.org>
PKG_LICENSE:=GPL-2.0


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DBUILD_OPENWRT=1

define Package/mentohust
  SECTION:=net
  CATEGORY:=Network
  TITLE:=MentoHUST
  URL:=https://github.com/HustLion/mentohust
  DEPENDS:=+libpcap
endef

define Package/mentohust/description
Open-source alternative to rjsupplicant.
endef

define Package/mentohust/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mentohust $(1)/usr/bin
	$(CP) ./files/etc $(1)/
endef

$(eval $(call BuildPackage,mentohust))
