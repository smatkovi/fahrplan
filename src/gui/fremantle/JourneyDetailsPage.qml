import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Fahrplan 1.0

Item {
    width: 800
    height: 480

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Text {
            text: "Journey Details"
            font.pointSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: fahrplanBackend.journeyDetails

            delegate: Rectangle {
                width: parent.width
                height: 60
                color: index % 2 === 0 ? "#ffffff" : "#f8f8f8"
                border.color: "#ccc"

                Column {
                    anchors.centerIn: parent
                    spacing: 4

                    Text {
                        text: model.stationName + " (" + model.time + ")"
                        font.bold: true
                    }

                    Text {
                        text: "Platform: " + model.platform + (model.note !== "" ? " — " + model.note : "")
                        font.pixelSize: 12
                        color: "#555"
                    }
                }
            }
        }

        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                Qt.callLater(() => pageLoader.source = "JourneyResultsPage.qml")
            }
        }
    }
}

