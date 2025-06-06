import QtQuick 2.1

Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage === 1) {
            introAnimation.running = true
        }
        // Animate progress bar on any stage change
        progressFill.width = (bottomRect.width / 6) * (stage - 1)
    }

    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height
        source: "images/rectangle.png"

        Image {
            source: "images/logo-512withname.png"
            sourceSize.width: 256
            sourceSize.height: 256
            anchors.centerIn: parent
        }
    }

    // Progress bar background
    Rectangle {
        id: bottomRect
        width: 320
        height: 8
        radius: 4
        color: "#ff004f"
        opacity: 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height

        // Progress bar fill
        Rectangle {
            id: progressFill
            width: 0
            height: parent.height
            radius: 4
            color: "#ff004f"

            Behavior on width {
                PropertyAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }

    Text {
        text: "Cinnuntu KDE V1.0.3"
        color: "white"
        font.pixelSize: 12
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
    }

    Text {
        text: "Cinnuntu Linux created by Izzy Kelemari"
        color: "white"
        font.pixelSize: 12
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
