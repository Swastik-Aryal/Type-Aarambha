QT += quick

SOURCES += \
        main.cpp \
        src/cpp/languageswitcher.cpp \
        src/cpp/lesson.cpp

resources.prefix = /$${TARGET}
RESOURCES += \
    qml.qrc \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += src/cpp

HEADERS += \
    src/cpp/languageswitcher.h \
    src/cpp/dataset.h \
    src/cpp/lesson.h

LIBS += -luser32
