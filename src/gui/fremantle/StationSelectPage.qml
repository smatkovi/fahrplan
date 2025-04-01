import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Fahrplan 1.0

Item {
    property bool selectingDeparture: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        TextField {
            placeholderText: "Search station..."
            onTextChanged: fahrplanBackend.findStationsByName(text.trim())
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: fahrplanBackend.stationSearchResults

            delegate: Item {
                width: parent.width
                height: 40

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (selectingDeparture)
                                fahrplanBackend.departureStation = model.name
                            else
                                fahrplanBackend.arrivalStation = model.name
                            // Back to main page
                            Qt.callLater(() => pageLoader.sourceComponent = mainPage)
                        }
                    }

                    Text {
                        text: model.name
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}

