import QtQuick
import QtQuick.Controls

import "PracticeMode"
import "GameMode"
import "ProfileMode"

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    visibility: Window.Maximized
    title: "Type-आरम्भ"

    minimumWidth: 1332
    minimumHeight: (minimumWidth / 16) * 9

     onClosing: testResultsModel.saveToFile("results.csv")

    Rectangle {
        anchors.fill: parent
        color: "#1b2028"
    }

    FontLoader {
        id: _NotoSansRegular
        source: "qrc:/assets/assets/fonts/NotoSans-Regular.ttf"
    }
    FontLoader {
        id: _NotoSansMedium
        source: "qrc:/assets/assets/fonts/NotoSans-Medium.ttf"
    }
    FontLoader {
        id: _NotoSansMono
        source: "qrc:/assets/assets/fonts/NotoSansMono.ttf"
    }
    FontLoader {
        id: _NotoSansDevanagari
        source: "qrc:/assets/assets/fonts/NotoSans-Devanagari.ttf"
    }

    FontLoader {
        id: _Baloo2
        source: "qrc:/assets/assets/fonts/Baloo2.ttf"
    }

    //font for prompt and user input
    property string __lessonFont: _NotoSansMono.name
    property int __lessonFontSize: 24
    property int __lessonFontSpacing: 1

    //curent language
    property string __currentLanguage: "english"
    on__CurrentLanguageChanged: {
        _practiceMode.js_updateKeyTexts()
        _practiceMode.__lessonState = "LessonOff"
        _practiceMode.js_finishLesson()
    }

    // Practice Mode
    PracticeMode {
        id: _practiceMode
        focus: true
    }

    // Game Mode
    GameMode {
        id: _gameMode

        visible: false
        clip: true
        scale: 0.85
        focus: true
    }

    // User Profile Mode
    UserProfileMode {
        id: _userProfileMode
        visible: false
        focus: true
    }

    HeaderBar {
        id: _headerBar
    }
}
