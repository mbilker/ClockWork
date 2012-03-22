THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2222

include theos/makefiles/common.mk

BUNDLE_NAME = ClockWork
ClockWork_FILES = ClockWorkController.m
ClockWork_INSTALL_PATH = /Library/WeeLoader/Plugins/
ClockWork_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
