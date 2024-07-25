include $(THEOS)/makefiles/common.mk
DEBUG=1
FINALPACKAGE=0
TARGET = iphone:11.2:11.2
TWEAK_NAME = ApolloUserAgentFix
ApolloUserAgentFix_FILES = Tweak.xm
ApolloUserAgentFix_CFLAGS = -fobjc-arc
ApolloUserAgentFix_FRAMEWORKS = UIKit, Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard && killall -9 lockdownd"
include $(THEOS_MAKE_PATH)/aggregate.mk
