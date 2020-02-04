import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow  {
    id: mainWindow
    visible: true
    width: 340
    height: 480
    title: qsTr("NoteBook")
    ModelNotes{
        id:notes
        anchors.fill: parent
        visible: false
        z:1
        onSignalExit: {
            notes.visible=false
        }
    }

    Item {
        anchors.fill: parent
        Rectangle {
            width:parent.width
            anchors.bottom: parent.bottom
            height: parent.height-img.height/2
            color: "#e6bf68"
        }
        Item{
            id: img
            width:parent.width-30
            height: parent.height/7
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: springImg
                fillMode: Image.Stretch
                anchors.fill: parent
                anchors.margins: 5
                source: "/new/prefix1/spring.png"
            }
        }
        Rectangle {
            id:dilimiter
            width:parent.width
            anchors.top: img.bottom
            height: 2
            color: "#040404"
        }
        TextEdit {
            id: textEdit
            width:parent.width-40
            height: (parent.height-img.height-dilimiter.height)*0.8-20
            anchors.top: dilimiter.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("")
            textFormat: Text.PlainText
            font.family: "Cambria"
            clip: true
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            antialiasing: true
            font.bold: false
            anchors.topMargin: 20
            font.pixelSize: parent.width/12

        }
        Row{
            id:rowMenu
            anchors.top: textEdit.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width
            height: (parent.height-img.height-dilimiter.height)*0.2
           //save button
            Item {
                width: rowMenu.width/4
                height: Math.min(width,parent.height)
                MouseArea{
                    id:buttonSave
                    anchors.fill: parent
                    onClicked: {
                        NoteBook.addNote(textEdit.text)
                        NoteBook.saveToFile()
                    }
                }
                Image {
                    id: imageSave
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    anchors.fill: parent
                    antialiasing: true
                    source: buttonSave.pressed?"/new/prefix1/noteSave2.png" :"/new/prefix1/noteSave.png"
                }
            }
            //clean button
            Item {
                width: rowMenu.width/4
                height: Math.min(width,parent.height)
                MouseArea{
                    id:buttonClean
                    anchors.fill: parent
                    onClicked: {
                        textEdit.clear()
                    }
                }
                Image {
                    id: imageClean
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    anchors.fill: parent
                    antialiasing: true
                    source: buttonClean.pressed?"/new/prefix1/noteClean2.png" :"/new/prefix1/noteClean.png"
                }
            }
            //search button
            Item {
                width: rowMenu.width/4
                height: Math.min(width,parent.height)
                MouseArea{
                    id:buttonSearch
                    anchors.fill: parent
                    onClicked: {                        
                        notes.visible=true
                    }
                }
                Image {
                    id: imageSearch
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    anchors.fill: parent
                    antialiasing: true
                    source: buttonSearch.pressed?"/new/prefix1/noteSearch2.png" :"/new/prefix1/noteSearch.png"
                }
            }
            //close button
            Item {
                width: rowMenu.width/4
                height: Math.min(width,parent.height)
                MouseArea{
                    id:buttonClose
                    anchors.fill: parent
                    onClicked: {
                        Qt.quit()
                    }
                }
                Image {
                    id: imageClose
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    anchors.fill: parent
                    antialiasing: true
                    source: buttonClose.pressed?"/new/prefix1/noteClose2.png" :"/new/prefix1/noteClose.png"
                }
            }
        }
    }
}

