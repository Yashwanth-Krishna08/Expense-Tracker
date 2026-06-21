import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Expense Tracker")
    property int p
    ColumnLayout
    {
        anchors.fill: parent
        spacing: 0
        Rectangle
        {
            id:header
            Layout.fillWidth: true
            height:50
            Layout.alignment: Qt.AlignTop
            color:"#197"
            RowLayout
            {
                spacing:5
                anchors.fill: parent
                Text {
                    id: head
                    text: qsTr("Expense Tracker")
                    font.bold: true
                    color:"#fff"
                    font.pointSize: 20
                    Layout.fillWidth: true
                    leftPadding: 20
                }
            }
        }

        Rectangle
        {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:main
            color:"#299"
            ColumnLayout
            {
                anchors.fill: parent
                spacing:10
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.topMargin: 20
                RowLayout
                {
                    anchors.fill: parent
                    spacing:10

                    TextField{
                        id:item
                        placeholderText: "Enter"
                        Layout.fillWidth: parent
                        Layout.alignment: Qt.AlignTop
                    }
                    TextField{
                        id:price
                        placeholderText: "Enter amount"
                        Layout.fillWidth: parent
                        Layout.alignment: Qt.AlignTop
                    }
                    Button
                    {
                        id:add
                        Layout.fillWidth: parent
                        text:"Add Item"
                        Layout.alignment: Qt.AlignTop
                        onClicked:
                        {
                            done.append({a:item.text+" "+price.text})
                            p=price.text
                            item.text=""
                            price.text=""
                        }
                    }
                }
                ListModel
                {
                    id:done
                }
                Rectangle
                {
                    id:sheet
                    Layout.fillWidth: parent
                    height:300
                    color:"#fff"
                    ColumnLayout
                    {
                        spacing:0
                        Repeater
                        {
                            model:done
                            Text{
                                leftPadding: 5
                                topPadding: 5
                                text:a
                                font.pointSize: 15
                            }
                        }
                    }
                }
                Rectangle
                {
                    id:total
                    Layout.fillWidth: true
                    height:35
                    color:"#fff"
                    Text {
                        property int r:r+p
                        id: to
                        text:r
                        font.pointSize: 20
                        font.bold: true
                    }
                }
            }
        }
    }
}
