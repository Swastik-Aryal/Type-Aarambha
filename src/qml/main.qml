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

    // Practice Mode
    PracticeMode {
        id: _practiceMode
    }

    // Game Mode
    GameMode {
        id: _gameMode
        visible: false
        scale: 0.85
        clip: true
    }

    // User Profile Mode
    UserProfileMode {
        id: _userProfileMode
        visible: false
    }

    HeaderBar {
        id: _headerBar
    }
}
