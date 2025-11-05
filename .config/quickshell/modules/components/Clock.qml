import QtQuick
import Quickshell

Bubble {
    topMargin: -1
    bottomMargin: -1

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        text: Qt.formatDateTime(clock.date, "ddd d MMM h:m")
        font.family: "Comic Sans MS"
        color: "#E2DAD6"
        font.pixelSize: 14
    }
}
