import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Fahrplan 1.0

Item {
    width: 800
    height: 480

    property bool initialized: false

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 12

        Label {
            text: "Select Parser (Backend)"
        }

        ComboBox {
            id: backendSelector
            Layout.fillWidth: true

            model: ListModel {
                ListElement { name: "Deutsche Bahn (Movas)" }
                ListElement { name: "ÖBB (Austria)" }
                ListElement { name: "Rejseplanen (Denmark)" }
                ListElement { name: "NRI (Japan)" }
                ListElement { name: "Västtrafik (Sweden)" }
                ListElement { name: "PTV (Australia)" }
                ListElement { name: "Sydney EFA" }
                ListElement { name: "Ireland EFA" }
                ListElement { name: "92.ch (Switzerland)" }
                ListElement { name: "Munich EFA" }
                ListElement { name: "Salzburg EFA" }
                ListElement { name: "ResRobot (Sweden)" }
                ListElement { name: "Matka.fi (Finland)" }
                ListElement { name: "VRR (Germany)" }
                ListElement { name: "Search.ch (Switzerland)" }
            }

            textRole: "name"

            onCurrentIndexChanged: {
                if (initialized) {
                    fahrplanBackend.setSettingsValue("currentBackend", currentIndex)
                    fahrplanBackend.setParser(currentIndex)
                    selectedLabel.text = "Set parser index: " + currentIndex
                }
            }

            Component.onCompleted: {
                // Read saved index, fallback to 1 (ÖBB)
                var savedIndex = fahrplanBackend.getSettingsValue("currentBackend", 1)
                currentIndex = savedIndex
                fahrplanBackend.setParser(currentIndex)
                initialized = true
            }
        }

        Label {
            id: selectedLabel
            text: "Set parser index: " + backendSelector.currentIndex
        }

        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                Qt.callLater(() => pageLoader.sourceComponent = mainPage)
            }
        }
    }
}

