include $(TOPDIR)/rules.mk

PKG_NAME:=mentohust
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/etnperlong/mentohust-minimal.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=b49462223a3e88fefc004f04056a6fe26e781596

PKG_MAINTAINER:=Mike Evans <etnperlong@gmail.com>
PKG_LICENSE:=GPL-2.0


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DBUILD_OPENWRT=1

define Package/mentohust
  SECTION:=net
  CATEGORY:=Network
  TITLE:=MentoHUST
  URL:=https://github.com/etnperlong/mentohust
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
