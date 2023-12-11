import QtQuick

FocusScope {
    anchors.fill: parent
    StatBar {
        id: _statBar
    }
    KeyboardLayout {
        id: _keyboardLayout
    }
    function js_updateKeyTexts() {
        _keyboardLayout.js_updateKeyTexts()
    }
    Lesson {
        id: _lessonInterface
    }

    function js_finishLesson() {
        _lessonInterface.js_finishLesson()
    }
}
