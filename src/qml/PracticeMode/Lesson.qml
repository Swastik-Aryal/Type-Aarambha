import QtQuick

Item {
    id: _testRect
    implicitWidth: parent.width * 0.50
    implicitHeight: parent.height * 0.11

    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        // verticalCenterOffset: parent.height / 3.5
    }

    TextInput {
        id: _testInput
        anchors.fill: parent
        font.pixelSize: 30
        font.family: _Baloo2.name
        color: "#CCCCB5"
        focus: true
        activeFocusOnTab: true

        Keys.onPressed: {
            if (event.key === Qt.Key_Shift) {
                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState
                        === "shift" ? "base" : "shift"
            } else if (event.key === Qt.Key_CapsLock) {
                _keyboardLayout.__capsLockPressed = !_keyboardLayout.__capsLockPressed

                if (_keyboardLayout.__capsLockPressed) {
                    _keyboardLayout.__shiftState = "shift"
                } else {
                    _keyboardLayout.__shiftState = "base"
                }
            }

            if (event.modifiers & Qt.ShiftModifier
                    && event.modifiers & Qt.AltModifier
                    && event.modifiers & Qt.ControlModifier) {
                _keyboardLayout.__shiftState = "shiftCtrlAlt"
            } else if (!(event.modifiers & Qt.ShiftModifier)
                       && event.modifiers & Qt.AltModifier
                       && event.modifiers & Qt.ControlModifier) {
                _keyboardLayout.__shiftState = "base"
            } else if (event.modifiers & Qt.ShiftModifier
                       && !(event.modifiers & Qt.AltModifier)
                       && event.modifiers & Qt.ControlModifier) {
                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState
                        === "shift" ? "base" : "shift"
            } else if (event.modifiers & Qt.ShiftModifier
                       && (event.modifiers & Qt.AltModifier)
                       && !(event.modifiers & Qt.ControlModifier)) {
                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState
                        === "shift" ? "base" : "shift"
            }
        }

        // Handle key release events
        Keys.onReleased: {
            if (event.key === Qt.Key_Shift) {
                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState
                        === "shift" ? "base" : "shift"
            }
        }


        /*
        Keys.onPressed: event => {
                            if (event.modifiers & Qt.NoModifier) {
                                key_pressed = true
                            }
                            if (caps_pressed === true) {
                                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState === "shift" ? "base" : "shift"
                            }


                            /*if (event.modifiers & Qt.ShiftModifier
                                && event.modifiers & Qt.AltModifier
                                && event.modifiers & Qt.ControlModifier) {
                                _keyboardLayout.__shiftState = "shiftCtrlAlt"
                                console.log("both pressed")
                            } else if (event.modifiers & Qt.ShiftModifier) {
                                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState === "base" ? "shift" : "base"
                                console.log("only shift")
                            } else if (event.modifiers & Qt.ControlModifier
                                       && event.modifiers & Qt.AltModifier) {
                                _keyboardLayout.__shiftState = "CtrlAltR"
                                console.log("both pressed")
                            }
                            if (event.key === Qt.Key_CapsLock) {

                                caps_pressed = caps_pressed === true ? false : true
                                console.log("caps pressed")
                            }
                            if (event.modifiers & Qt.ShiftModifier) {
                                _keyboardLayout.__shiftState = _keyboardLayout.__shiftState === "base" ? "shift" : "base"
                                console.log("shift pressed")
                            }
                        }

        Keys.onReleased: event => {
                             if (!(event.modifiers & Qt.ShiftModifier)) {
                                 _keyboardLayout.__shiftState = _keyboardLayout.__shiftState === "base" ? "shift" : "base"
                                 console.log("shift released")
                             }
                         }

        */
    }
}
