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
            text: "Journey Results"
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: fahrplanBackend.journeyResults

            delegate: Rectangle {
                width: parent.width
                height: 60
                color: index % 2 === 0 ? "#f0f0f0" : "#e0e0e0"
                border.color: "#999"

                Column {
                    anchors.centerIn: parent
                    spacing: 2

                    Text {
                        text: model.departureTime + " → " + model.arrivalTime
                        font.bold: true
                    }

                    Text {
                        text: model.departureStation + " → " + model.arrivalStation
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        fahrplanBackend.selectJourney(index)
                        // Load JourneyDetailsPage.qml here if implemented
                        // pageLoader.source = "JourneyDetailsPage.qml"
                    }
                }
            }
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

