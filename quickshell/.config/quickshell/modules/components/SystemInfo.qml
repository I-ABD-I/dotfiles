import "../data/"
import QtQuick

Bubble {
    id: root
    topMargin: -1
    bottomMargin: -1
    Connections {
        target: CPUInfo

        function onCpuFractionUpdate(fraction) {
            root.cpuUsage = fraction;
        }
    }

    property real cpuUsage: 0

    Text {
        text: `󰔂  ${root.cpuUsage.toFixed(0)}%`
        font.family: "Comic Sans MS"
        color: "#E2DAD6"
        font.pixelSize: 14
    }
}
