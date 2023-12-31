QT += qml quick charts
SOURCES += \
        main.cpp \
        src/cpp/layoutswitcher.cpp \
        src/cpp/lesson.cpp \
        src/cpp/resultssortfilterproxymodel.cpp \
        src/cpp/testresults.cpp \
        src/cpp/testresultsmodel.cpp 

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
    src/cpp/layoutswitcher.h \
    src/cpp/dataset.h \
    src/cpp/lesson.h \
    src/cpp/resultssortfilterproxymodel.h \
    src/cpp/testresults.h \
    src/cpp/testresultsmodel.h

LIBS += -luser32

RC_ICONS = assets\img\typearrambhaicon.ico
