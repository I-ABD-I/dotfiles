import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../components/"

Variants {
    model: Quickshell.screens
    delegate: PanelWindow {
        id: panel
        property var modelData

        screen: modelData
        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 32
        color: "transparent"
        margins {
            left: 0
            right: 0
            top: 0
            bottom: 0
        }

        Rectangle {
            id: bar
            anchors.fill: parent
            color: "transparent"

            Row {
                spacing: 4
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 4
                }
                Workspaces {}
                WindowTitle {}
                Media {}
            }
            Row {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                Clock {}
            }
            Row {
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 100
                }
                SystemInfo {}
            }
        }
    }
}
