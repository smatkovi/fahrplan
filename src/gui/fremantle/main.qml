/****************************************************************************
**
**  This file is a part of Fahrplan.
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License along
**  with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Fahrplan 1.0
import "hildon"
import "components" as MyComponents

HildonWindow {
    width: 800
    height: 480
    visible: true

    FahrplanBackend {
        id: fahrplanBackend
    }

    Loader {
        id: pageLoader
        anchors.fill: parent
        sourceComponent: mainPage
    }

    Component {
        id: mainPage

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12

                MyComponents.SubTitleButton {
                    titleText: "Departure Station"
                    subTitleText: fahrplanBackend.departureStationName
                    onClicked: {
                        pageLoader.setSource("StationSelectPage.qml", {
                            "selectingDeparture": true
                        })
                    }
                }

                MyComponents.SubTitleButton {
                    titleText: "Arrival Station"
                    subTitleText: fahrplanBackend.arrivalStationName
                    onClicked: {
                        pageLoader.setSource("StationSelectPage.qml", {
                            "selectingDeparture": false
                        })
                    }
                }

                ComboBox {
                    model: ["Now", "Departure", "Arrival"]
                    currentIndex: fahrplanBackend.mode
                    onCurrentIndexChanged: fahrplanBackend.mode = currentIndex
                }

                Button {
                    text: "Search Journey"
                    onClicked: {
                        fahrplanBackend.searchJourneys()
                        pageLoader.source = "JourneyResultsPage.qml"
                    }
                }

                Button {
                    text: "Settings"
                    onClicked: {
                        pageLoader.source = "SettingsPage.qml"
                    }
                }
            }
        }
    }
}

