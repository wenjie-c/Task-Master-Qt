import QtQuick
import QtQuick.Controls 2.15

    Window {
        width: 640
        height: 480
        visible: true
        title: qsTr("Task Master")
        StackView{
            anchors.fill: parent
                id: contentFrame
                initialItem: Qt.resolvedUrl("Load_Page.qml")
                Component.onCompleted: {
                    contentFrame.replace( Qt.resolvedUrl("Main_Page.qml")) // Si funciona
                }
            }
    }
