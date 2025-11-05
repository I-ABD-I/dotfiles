import Quickshell.Services.Mpris
import QtQuick

Bubble {
    id: media
    property var player: Mpris.players.values[0]
    topMargin: -1
    bottomMargin: -1

    Text {
        text: {
            const artist = media.player?.trackArtist;
            const title = media.player?.trackTitle;

            if (title?.startsWith(artist)) {
                return `󰎇  ${title}`;
            }
            return `󰎇  ${artist} - ${title}`;
        }
        color: "#E2DAD6"
        font.pixelSize: 14
        font.family: "Comic Sans MS"
    }
}
