import QtQuick 2.0
import QtQuick.Controls 2.15


Item{
    width: parent.width
    height: parent.height
    Component.onCompleted: {
            console.log("parent =", parent)
            console.log("width =", width)
            console.log("height =", height)
        }
    Rectangle{
        id:bgRec
        anchors.fill: parent
        //color: "red"

        ListView{
            id: listview
            anchors.fill: parent
            header: Item{
                id: headerListView
                width: parent.width
                height: 50
                Rectangle{
                    id:bgRec2
                    anchors.fill: parent
                    color: "#f2f3f4"
                }

                Label {
                    //id: mainLbl
                    anchors.centerIn: parent
                    text: "Task-Master"
                    color: "black"
                    font.pointSize: 16
                }
            }
            model: ListModel{
                id: myListModel
            }
            /*
            delegate: Item {
                id: myDelegate
                width: parent.width
                height: 50
                Label{
                    id: title
                    text: titleText
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    id: date
                    text: dateText
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                }
            }
            */
            footer: Item {
                id:footerListView
                width: parent.width
                height: 50
                children: [
                    RoundButton {
                        id: addTaskButton
                        //width: 40
                        width: children.width
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin:  10
                        onClicked: {
                            addTask_Drawer.open()
                            backend.setMessage('Hello from QML!')
                        }
                        text: qsTr("Add task")
                    }

                ]

            }
            delegate: MouseArea{
                id: myDelegate
                width: parent.width
                height: 50
                onPressAndHold: {
                    listview.currentIndex = index
                    myListModel.remove(listview.currentIndex)
                    backend.setMessage(`Item with index ${index} is deleted.`)
                }
                Label{
                    id: title
                    text: titleText
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    id: date
                    text: dateText
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                }
            }
        }
        AddTask_Drawer{
            id:addTask_Drawer

        }
    }




}
