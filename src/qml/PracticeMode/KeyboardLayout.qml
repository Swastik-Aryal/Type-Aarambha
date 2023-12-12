import QtQuick
import QtQuick.Layouts

// Main Item containing the keyboard layout
Item {

    property string __shiftState: "base"
    property bool __capsLockPressed: false

    id: _keyboardLayoutItem

    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.25

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: parent.height / 3.5
    }

    // Column layout for arranging rows of keys
    ColumnLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter
        spacing: 4

        RowLayout {
            id: _numberRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {
                id: _backtickKey
                __iso: "E00"
            }

            Keycap {
                id: _oneKey
                __iso: "E01"
            }

            Keycap {
                id: _twoKey
                __iso: "E02"
            }

            Keycap {
                id: _threeKey
                __iso: "E03"
            }

            Keycap {
                id: _fourKey
                __iso: "E04"
            }

            Keycap {
                id: _fiveKey
                __iso: "E05"
            }

            Keycap {
                id: _sixKey
                __iso: "E06"
            }

            Keycap {
                id: _sevenKey
                __iso: "E07"
            }

            Keycap {
                id: _eightKey
                __iso: "E08"
            }

            Keycap {
                id: _nineKey
                __iso: "E09"
            }

            Keycap {
                id: _zeroKey
                __iso: "E10"
            }

            Keycap {
                id: _minusKey
                __iso: "E11"
            }

            Keycap {
                id: _equalsKey
                __iso: "E12"
            }
            Keycap {
                id: _backspaceKey
                width: __keyWidth * 2.25
                __keyText: "<---"
            }
        }

        RowLayout {
            id: _topRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Keycap {
                id: _tabKey
                width: __keyWidth * 1.625
                __keyText: "TAB"
            }
            Keycap {
                id: _qKey
                __iso: "D01"
            }

            Keycap {
                id: _wKey
                __iso: "D02"
            }

            Keycap {
                id: _eKey
                __iso: "D03"
            }

            Keycap {
                id: _rKey
                __iso: "D04"
            }

            Keycap {
                id: _tKey
                __iso: "D05"
            }

            Keycap {
                id: _yKey
                __iso: "D06"
            }

            Keycap {
                id: _uKey
                __iso: "D07"
            }

            Keycap {
                id: _iKey
                __iso: "D08"
            }

            Keycap {
                id: _oKey
                __iso: "D09"
            }

            Keycap {
                id: _pKey
                __iso: "D10"
            }

            Keycap {
                id: _openSquareBracketKey
                __iso: "D11"
            }

            Keycap {
                id: _closeSquareBracketKey
                __iso: "D12"
            }

            Keycap {
                id: _backslashKey
                __iso: "C12"
                width: __keyWidth * 1.625
            }
        }

        RowLayout {
            id: _homeRow
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            spacing: 4
            Keycap {
                id: _capsKey
                width: __keyWidth * 2
                __keyText: "CAPS"
            }
            Keycap {
                id: _aKey
                __iso: "C01"
            }

            Keycap {
                id: _sKey
                __iso: "C02"
            }

            Keycap {
                id: _dKey
                __iso: "C03"
            }

            Keycap {
                id: _fKey
                __iso: "C04"
            }

            Keycap {
                id: _gKey
                __iso: "C05"
            }

            Keycap {
                id: _hKey
                __iso: "C06"
            }

            Keycap {
                id: _jKey
                __iso: "C07"
            }

            Keycap {
                id: _kKey
                __iso: "C08"
            }

            Keycap {
                id: _lKey
                __iso: "C09"
            }

            Keycap {
                id: _semicolonKey
                __iso: "C10"
            }

            Keycap {
                id: _apostropheKey
                __iso: "C11"
            }

            Keycap {
                id: _enterKey
                width: __keyWidth * 2.35
                __keyText: "ENTER"
            }
        }

        RowLayout {
            id: _bottomRow
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 4
            Keycap {
                id: _leftShiftKey
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        __shiftState = "shift"
                        parent.__keyShadowColor = "#CCCCB5"
                        parent.__keyShadowColor = "#CCCCB5"
                        parent.__keyRectColor = "#AFAF89"
                        parent.__keyTextColor = "#151A21"
                    }
                    onReleased: {
                        __shiftState = "base"
                        parent.__keyShadowColor = "#1B2028"
                        parent.__keyShadowColor = "#1B2028"
                        parent.__keyRectColor = "#151A21"
                        parent.__keyTextColor = "#CCCCB5"
                    }
                }
            }
            Keycap {
                id: _zKey
                __iso: "B01"
            }

            Keycap {
                id: _xKey
                __iso: "B02"
            }

            Keycap {
                id: _cKey
                __iso: "B03"
            }

            Keycap {
                id: _vKey
                __iso: "B04"
            }

            Keycap {
                id: _bKey
                __iso: "B05"
            }

            Keycap {
                id: _nKey
                __iso: "B06"
            }

            Keycap {
                id: _mKey
                __iso: "B07"
            }

            Keycap {
                id: _commaKey
                __iso: "B08"
            }

            Keycap {
                id: _dotKey
                __iso: "B09"
            }

            Keycap {
                id: _slashKey
                __iso: "B10"
            }
            Keycap {
                id: _rightShiftKey
                width: __keyWidth * 2.725
                __keyText: "SHIFT"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        __shiftState = "shift"
                        parent.__keyShadowColor = "#CCCCB5"
                        parent.__keyShadowColor = "#CCCCB5"
                        parent.__keyRectColor = "#AFAF89"
                        parent.__keyTextColor = "#151A21"
                    }
                    onReleased: {
                        __shiftState = "base"
                        parent.__keyShadowColor = "#1B2028"
                        parent.__keyShadowColor = "#1B2028"
                        parent.__keyRectColor = "#151A21"
                        parent.__keyTextColor = "#CCCCB5"
                    }
                }
            }
        }

        RowLayout {
            id: _spacebarRow
            Layout.alignment: Qt.AlignHCenter
            spacing: 4
            Layout.fillHeight: true
            Keycap {
                id: _leftCtrlKey
                width: __keyWidth * 3.125
                __keyText: "CTRL"
            }
            Keycap {
                id: _leftAltKey
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                id: _spacebarKey
                width: __keyWidth * 6.65
                __keyText: ""
                Rectangle {
                    // for the dash in the spacebar
                    anchors.centerIn: parent
                    radius: 50
                    color: _spacebarKey.__keyTextColor
                    width: parent.width * 0.65
                    height: parent.height * 0.04
                    anchors.verticalCenterOffset: -parent.height / 8
                }
            }
            Keycap {
                id: _rightAltKey
                width: __keyWidth * 1.625
                __keyText: "ALT"
            }
            Keycap {
                id: _rightCtrlKey
                width: __keyWidth * 3.125
                __keyText: "CTRL"
            }
        }
    }

    property var keyList: [_backtickKey, _oneKey, _twoKey, _threeKey, _fourKey, _fiveKey, _sixKey, _sevenKey, _eightKey, _nineKey, _zeroKey, _minusKey, _equalsKey, _qKey, _wKey, _eKey, _rKey, _tKey, _yKey, _uKey, _iKey, _oKey, _pKey, _openSquareBracketKey, _closeSquareBracketKey, _backslashKey, _aKey, _sKey, _dKey, _fKey, _gKey, _hKey, _jKey, _kKey, _lKey, _semicolonKey, _apostropheKey, _zKey, _xKey, _cKey, _vKey, _bKey, _nKey, _mKey, _commaKey, _dotKey, _slashKey, _spacebarKey]

    property var translationDict: {
        "english": {
            "base": {
                "E00": "`",
                "E01": "1",
                "E02": "2",
                "E03": "3",
                "E04": "4",
                "E05": "5",
                "E06": "6",
                "E07": "7",
                "E08": "8",
                "E09": "9",
                "E10": "0",
                "E11": "-",
                "E12": "=",
                "D01": "q",
                "D02": "w",
                "D03": "e",
                "D04": "r",
                "D05": "t",
                "D06": "y",
                "D07": "u",
                "D08": "i",
                "D09": "o",
                "D10": "p",
                "D11": "[",
                "D12": "]",
                "C12": "\\",
                "C01": "a",
                "C02": "s",
                "C03": "d",
                "C04": "f",
                "C05": "g",
                "C06": "h",
                "C07": "j",
                "C08": "k",
                "C09": "l",
                "C10": ";",
                "C11": "'",
                "B00": "\\",
                "B01": "z",
                "B02": "x",
                "B03": "c",
                "B04": "v",
                "B05": "b",
                "B06": "n",
                "B07": "m",
                "B08": ",",
                "B09": ".",
                "B10": "/"
            },
            "shift": {
                "E00": "~",
                "E01": "!",
                "E02": "@",
                "E03": "#",
                "E04": "$",
                "E05": "%",
                "E06": "^",
                "E07": "&",
                "E08": "*",
                "E09": "(",
                "E10": ")",
                "E11": "_",
                "E12": "+",
                "D01": "Q",
                "D02": "W",
                "D03": "E",
                "D04": "R",
                "D05": "T",
                "D06": "Y",
                "D07": "U",
                "D08": "I",
                "D09": "O",
                "D10": "P",
                "D11": "{",
                "D12": "}",
                "C12": "|",
                "C01": "A",
                "C02": "S",
                "C03": "D",
                "C04": "F",
                "C05": "G",
                "C06": "H",
                "C07": "J",
                "C08": "K",
                "C09": "L",
                "C10": ":",
                "C11": "\u{22}",
                "B00": "|",
                "B01": "Z",
                "B02": "X",
                "B03": "C",
                "B04": "V",
                "B05": "B",
                "B06": "N",
                "B07": "M",
                "B08": "<",
                "B09": ">",
                "B10": "?"
            }
        },
        "nepali": {
            "base": {
                "E00": "ञ",
                "E01": "ज\u{94D}ञ",
                "E02": "घ",
                "E03": "ङ",
                "E04": "झ",
                "E05": "छ",
                "E06": "ट",
                "E07": "ठ",
                "E08": "ड",
                "E09": "ढ",
                "E10": "ण",
                "E11": "(",
                "E12": ".",
                "D01": "त\u{94D}र",
                "D02": "ध",
                "D03": "भ",
                "D04": "च",
                "D05": "त",
                "D06": "थ",
                "D07": "ग",
                "D08": "ष",
                "D09": "य",
                "D10": "उ",
                "D11": "\u{943}",
                "D12": "\u{947}",
                "C12": "\u{94D}र",
                "C01": "ब",
                "C02": "क",
                "C03": "म",
                "C04": "\u{93E}",
                "C05": "न",
                "C06": "ज",
                "C07": "व",
                "C08": "प",
                "C09": "\u{93F}",
                "C10": "स",
                "C11": "\u{941}",
                "B01": "श",
                "B02": "ह",
                "B03": "अ",
                "B04": "ख",
                "B05": "द",
                "B06": "ल",
                "B07": "फ",
                "B08": ",",
                "B09": "।",
                "B10": "र"
            },
            "shift": {
                "E00": "ञ\u{94D}",
                "E01": "१",
                "E02": "२",
                "E03": "३",
                "E04": "४",
                "E05": "५",
                "E06": "६",
                "E07": "७",
                "E08": "८",
                "E09": "९",
                "E10": "०",
                "E11": ")",
                "E12": "\u{902}",
                "D00": "\u{09}",
                "D01": "\u{94B}",
                "D02": "ध\u{94D}",
                "D03": "भ\u{94D}",
                "D04": "च\u{94D}",
                "D05": "त\u{94D}",
                "D06": "थ\u{94D}",
                "D07": "ग\u{94D}",
                "D08": "क\u{94D}ष",
                "D09": "इ",
                "D10": "ए",
                "D11": "र\u{94D}",
                "D12": "\u{948}",
                "C12": "\u{94D}",
                "C01": "ब\u{94D}",
                "C02": "क\u{94D}",
                "C03": "म\u{94D}",
                "C04": "\u{901}",
                "C05": "न\u{94D}",
                "C06": "ज\u{94D}",
                "C07": "व\u{94D}",
                "C08": "प\u{94D}",
                "C09": "\u{940}",
                "C10": "स\u{94D}",
                "C11": "\u{942}",
                "B01": "श\u{94D}",
                "B02": "ह\u{94D}",
                "B03": "ऋ",
                "B04": "ख\u{94D}",
                "B05": "द\u{94D}",
                "B06": "ल\u{94D}",
                "B07": "\u{903}",
                "B08": "?",
                "B09": "श\u{94D}र",
                "B10": "र\u{942}"
            },
            "CtrlAltR": {
                "E00": "",
                "E01": "1",
                "E02": "2",
                "E03": "3",
                "E04": "4",
                "E05": "5",
                "E06": "6",
                "E07": "7",
                "E08": "8",
                "E09": "9",
                "E10": "0",
                "E11": "",
                "E12": "+",
                "D01": "",
                "D02": "",
                "D03": "",
                "D04": "",
                "D05": "",
                "D06": "",
                "D07": "",
                "D08": "",
                "D09": "",
                "D10": "ऊ",
                "D11": "",
                "D12": "औ",
                "C12": "",
                "C01": "",
                "C02": "",
                "C03": "",
                "C04": "",
                "C05": "",
                "C06": "",
                "C07": "",
                "C08": "",
                "C09": "",
                "C10": "",
                "C11": "",
                "B00": "",
                "B01": "",
                "B02": "",
                "B03": "आ",
                "B04": "",
                "B05": "",
                "B06": "",
                "B07": "",
                "B08": "",
                "B09": "",
                "B10": ""
            },
            "shiftCtrlAlt": {
                "E00": "",
                "E01": "!",
                "E02": "@",
                "E03": "#",
                "E04": "$",
                "E05": "%",
                "E06": "^",
                "E07": "&",
                "E08": "*",
                "E09": "'",
                "E10": "\u{22}",
                "E11": "-",
                "E12": "=",
                "D01": "\u{94C}",
                "D02": "",
                "D03": "",
                "D04": "",
                "D05": "",
                "D06": "",
                "D07": "",
                "D08": "",
                "D09": "ई",
                "D10": "ऐ",
                "D11": "",
                "D12": "ओ",
                "C12": "",
                "C01": "",
                "C02": "",
                "C03": "",
                "C04": "",
                "C05": "",
                "C06": "",
                "C07": "",
                "C08": "",
                "C09": "",
                "C10": "",
                "C11": "",
                "B00": "",
                "B01": "",
                "B02": "",
                "B03": "",
                "B04": "",
                "B05": "",
                "B06": "",
                "B07": "",
                "B08": "",
                "B09": "",
                "B10": ""
            }
        }
    }

    //updates the text on the keycops
    function js_updateKeyTexts() {
        for (var i = 0; i < keyList.length - 1; ++i) {
            var key = keyList[i]
            key.__keyText = js_getKeyText(key.__iso)
        }
    }

    function js_updateKeyboardHint() {
        var nextCharacter = lessonObj.getNextCharacter(
                    _lessonInterface.__inputText)
        var keyIso
        console.log("next char: " + nextCharacter)

        switch (nextCharacter) {
        case "space":
            keyIso = _spacebarKey
            break
        default:
            keyIso = js_getKeyIso(nextCharacter)
        }
        for (var i = 0; i < keyList.length; ++i) {
            var key = keyList[i]
            if (key.__lightSwitch === true) {
                key.__lightSwitch = false
                key.js_keyLightUp()
            }
            if (key.__iso === keyIso) {
                key.__lightSwitch = true
                key.js_keyLightUp()
            }
        }
    }

    //lookup dict for the characters of the keyboards
    function js_getKeyText(keyIso) {
        if (__currentLanguage === "english" && __shiftState !== "base"
                && __shiftState !== "shift") {
            return translationDict[__currentLanguage]["base"][keyIso]
        } else {
            return translationDict[__currentLanguage][__shiftState][keyIso]
        }
    }

    function js_getKeyIso(character) {
        for (var language in translationDict) {
            for (var category in translationDict[language]) {
                var keyIsoMap = translationDict[language][category]
                var keyIso = Object.keys(keyIsoMap).find(function (key) {
                    return keyIsoMap[key] === character
                })

                if (keyIso) {
                    return keyIso
                }
            }
        }
    }

    on__ShiftStateChanged: {
        js_updateKeyTexts()
    }

    Component.onCompleted: {
        js_updateKeyTexts()
    }
}
