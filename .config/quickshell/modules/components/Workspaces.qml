import QtQuick
import Quickshell.Hyprland

Bubble {

    Row {
        id: workspacesRow

        spacing: 4

        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                id: workspaceItem
                required property HyprlandWorkspace modelData

                property var monitorColors: ({
                        0: "#6495ED",
                        1: "#D0BFFF"
                    })

                width: modelData.focused ? 32 : 16
                height: 16
                radius: 16
                color: {
                    if (workspaceItem.modelData.toplevels.values.length == 0) {
                        return "#635F5F";
                    }

                    return monitorColors[workspaceItem.modelData.monitor?.id] || "gray";
                }
                border.color: monitorColors[workspaceItem.modelData.monitor?.id] || "gray"
                border.width: 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: workspaceItem.modelData.activate()
                }
                Text {
                    text: workspaceItem.modelData.id
                    anchors.centerIn: parent
                    font.pixelSize: 12
                    font.family: "Comic Sans MS"
                    font.weight: Font.Normal
                    color: workspaceItem.modelData.toplevels.values.length == 0 ? "white" : "black"
                }
            }
        }
    }
}
