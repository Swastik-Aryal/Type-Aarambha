import QtQuick

Rectangle {
    property string __keyText: ""
    property real __keyWidth: 40
    //outer Rectangle
    id: _rootRectKey

    width: 40
    height: 40
    color: "#151A21"
    radius: height * 0.15

    Rectangle {
        //inner rectangle for non-curved top corners
        width: _rootRectKey.width - 12
        height: parent.height * 0.50
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#1B2028"
    }

    Rectangle {
        id: _shadowRect
        radius: parent.radius
        width: _rootRectKey.width - 12
        height: parent.height * 0.75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: "#1B2028"
        Text {
            text: __keyText
            font.family: _Baloo2.name
            font.pixelSize: parent.height * 0.5
            color: "#CCCCB5"
            anchors.centerIn: parent
            //   anchors.verticalCenterOffset: -(parent.height / 8)
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            _rootRectKey.scale = 0.85
        }
        onReleased: {
            _rootRectKey.scale = 1
        }
    }
}
