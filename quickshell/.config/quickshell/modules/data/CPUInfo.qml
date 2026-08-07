pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    signal cpuFractionUpdate(real fraction)

    property real prevTotal: 0
    property real prevWork: 0

    Timer {
        interval: 5000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            file.reload();
            const text = file.text();
            if (!text)
                return;
            const cpuAll = text.match(/^.+/)[0];
            const [user, nice, system, idle, iowait, irq, softirq, steal, guest, guestNice] = cpuAll.match(/\d+/g).map(Number);

            const workTime = user + nice + system + irq + softirq;
            const newTotal = workTime + idle + iowait + guest + guestNice + steal;

            root.cpuFractionUpdate((workTime - root.prevWork) / (newTotal - root.prevTotal) * 100);

            root.prevWork = workTime;
            root.prevTotal = newTotal;
        }
    }

    FileView {
        id: file
        path: "/proc/stat"
    }
}
