import QtQuick

Rectangle {
    property string __iso: ""
    property string __keyText: ""
    property real __keyWidth: 40
    property color __keyShadowColor: "#1B2028"
    property color __keyTextColor: "#CCCCB5"
    property color __keyRectColor: "#151A21"

    //outer Rectangle
    id: _rootRectKey
    width: 40
    height: 40
    color: __keyRectColor
    radius: height * 0.15

    Rectangle {
        //inner rectangle for non-curved top corners
        id: _cornerRectKey
        width: _rootRectKey.width - 12
        height: parent.height * 0.50
        anchors.horizontalCenter: parent.horizontalCenter
        color: __keyShadowColor
    }

    Rectangle {
        id: _shadowRectKey
        radius: parent.radius
        width: _rootRectKey.width - 12
        height: parent.height * 0.75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: __keyShadowColor
        Text {
            id: _keyText
            text: __keyText
            font.family: _Baloo2.name
            font.pixelSize: parent.height * 0.5
            color: __keyTextColor
            anchors.centerIn: parent
            //   anchors.verticalCenterOffset: -(parent.height / 8)
        }
    }
    MouseArea {
        anchors.fill: parent

        onPressed: {
            __keyShadowColor = "#CCCCB5"
            __keyShadowColor = "#CCCCB5"
            __keyRectColor = "#AFAF89"
            __keyTextColor = "#151A21"
        }
        onReleased: {
            __keyShadowColor = "#1B2028"
            __keyShadowColor = "#1B2028"
            __keyRectColor = "#151A21"
            __keyTextColor = "#CCCCB5"
        }
    }
}
