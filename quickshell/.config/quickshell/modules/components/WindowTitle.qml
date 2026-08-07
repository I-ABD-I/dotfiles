import QtQuick
import Quickshell.Hyprland
import Quickshell.Wayland

Bubble {

    visible: Hyprland.activeToplevel
    Text {
        text: {
            const title = String(ToplevelManager.activeToplevel?.title || "");

            if (title.length > 60) {
                return title.slice(0, 60 - 3) + '...';
            } else {
                return title;
            }
        }
        font.pixelSize: 12
        color: "#E2DAD6"
        font.family: "Comic Sans MS"
    }
}
