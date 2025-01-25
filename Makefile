ifeq ($(ROOTLESS),1)
THEOS_PACKAGE_SCHEME=rootless
endif

ARCHS = arm64
INSTALL_TARGET_PROCESSES = YouTubeMusic
TARGET = iphone:clang:16.4:15.0
PACKAGE_VERSION = 2.0.5

THEOS_DEVICE_IP = 192.168.1.9
THEOS_DEVICE_PORT = 22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTMusicUltimate

$(TWEAK_NAME)_FILES = $(shell find Source -name '*.xm' -o -name '*.x' -o -name '*.m')
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -DTWEAK_VERSION=$(PACKAGE_VERSION)
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation AVFoundation AVKit Photos Accelerate CoreMotion AudioToolbox GameController VideoToolbox
$(TWEAK_NAME)_INJECT_DYLIBS = .theos/obj/YTMABConfig.dylib .theos/obj/ReturnYouTubeMusicDislikes.dylib
$(TWEAK_NAME)_OBJ_FILES = $(shell find Source/Utils/lib -name '*.a')
$(TWEAK_NAME)_LIBRARIES = bz2 c++ iconv z
SUBPROJECTS += Tweaks/YTMABConfig Tweaks/Return-YouTube-Music-Dislikes
ifeq ($(SIDELOADING),1)
$(TWEAK_NAME)_FILES += Sideloading.xm
endif

include $(THEOS_MAKE_PATH)/tweak.mk
