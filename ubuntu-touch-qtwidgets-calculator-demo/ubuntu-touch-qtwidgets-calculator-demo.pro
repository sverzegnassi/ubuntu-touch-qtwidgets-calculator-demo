TEMPLATE = app
TARGET = ubuntu-touch-qtwidgets-calculator-demo

load(ubuntu-click)

QT += widgets

HEADERS = button.h \
          calculator.h \

SOURCES = button.cpp \
          calculator.cpp \
          main.cpp \

CONF_FILES +=  ubuntu-touch-qtwidgets-calculator-demo.apparmor \
               ubuntu-touch-qtwidgets-calculator-demo.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               ubuntu-touch-qtwidgets-calculator-demo.desktop

#specify where the config files are installed to
config_files.path = /ubuntu-touch-qtwidgets-calculator-demo
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /ubuntu-touch-qtwidgets-calculator-demo
desktop_file.files = $$OUT_PWD/ubuntu-touch-qtwidgets-calculator-demo.desktop
desktop_file.CONFIG += no_check_exist
INSTALLS+=desktop_file

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target
