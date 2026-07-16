import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: mainWin

    width: 1200
    height: 1000
    minimumWidth: 1000
    minimumHeight: 800
    visible: true

    // --- HEADER / TOP BAR ---
    Rectangle {
        id: header
        property real heightPct: 10

        width: parent.width
        height: mainWin.height * heightPct / 100

        border.color: "white"
        border.width: 1
        color: "#232323"

        MouseArea {
            id: headerHandle
            width: parent.width
            height: 5
            anchors.bottom: parent.bottom
            hoverEnabled: true
            cursorShape: Qt.SizeVerCursor

            onPositionChanged: (mouse) => {
                if (headerHandle.pressed) {
                    let mousePosY = headerHandle.mapToItem(null, mouse.x, mouse.y).y

                    let minHeight = 10 * mainWin.height / 100
                    let maxHeight = 40 * mainWin.height / 100

                    if (mousePosY >= minHeight && mousePosY <= maxHeight) {
                        header.heightPct = (mousePosY * 100) / mainWin.height
                    }
                }
            }
        }
        Text { text: "HEADER"; color: "white"; anchors.centerIn: parent }
    }

    // --- LEFT SIDEBAR ---
    Rectangle {
        id: leftSide
        property real widthPct: 20

        width: mainWin.width * widthPct / 100
        anchors.left: parent.left
        anchors.top: header.bottom
        anchors.bottom: footer.top

        border.color: "white"
        border.width: 1
        color: "#232323"

        MouseArea {
            id: leftHandle
            width: 6
            height: parent.height
            anchors.right: parent.right
            hoverEnabled: true
            cursorShape: Qt.SizeHorCursor

            onPositionChanged: (mouse) => {
                if (leftHandle.pressed) {
                    let mousePosx = leftHandle.mapToItem(null, mouse.x, mouse.y).x

                    let minWidth = 15 * mainWin.width / 100
                    let maxWidth = 30 * mainWin.width / 100

                    if (mousePosx >= minWidth && mousePosx <= maxWidth) {
                        leftSide.widthPct = mousePosx * 100 / mainWin.width
                    }
                }
            }
        }
        Text { text: "LEFT SIDEBAR"; color: "white"; anchors.centerIn: parent }
    }

    // --- RIGHT SIDEBAR CONTAINER ---
    Rectangle {
        id: rightSide
        property real widthPct: 20
        property real upperPct: 50

        width: widthPct * mainWin.width / 100
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.bottom: footer.top

        MouseArea {
            id: rightHandle
            width: 6
            height: parent.height
            anchors.left: parent.left
            hoverEnabled: true
            cursorShape: Qt.SizeHorCursor

            onPositionChanged: (mouse) => {
                if (rightHandle.pressed) {
                    let mousePosx = rightHandle.mapToItem(null, mouse.x, mouse.y).x
                    let newWidth = mainWin.width - mousePosx
                    let minWidth = 15 * mainWin.width / 100
                    let maxWidth = 30 * mainWin.width / 100

                    if (newWidth >= minWidth && newWidth <= maxWidth) {
                        rightSide.widthPct = newWidth * 100 / mainWin.width
                    }
                }
            }
        }

        // Right Sidebar - Upper Section
        Rectangle {
            id: rightUpper
            width: parent.width
            height: parent.height * rightSide.upperPct / 100
            anchors.top: parent.top

            border.color: "white"
            border.width: 1
            color: "#232323"

            MouseArea {
                id: rightUpperHandle
                width: parent.width
                height: 5
                anchors.bottom: parent.bottom
                hoverEnabled: true
                cursorShape: Qt.SizeVerCursor

                onPositionChanged: (mouse) => {
                    if (rightUpperHandle.pressed) {
                        let relY = rightUpperHandle.mapToItem(rightSide, mouse.x, mouse.y).y
                        let minHeight = 15 * rightSide.height / 100
                        let maxHeight = 80 * rightSide.height / 100

                        if (relY >= minHeight && relY <= maxHeight) {
                            rightSide.upperPct = (relY * 100) / rightSide.height
                        }
                    }
                }
            }
            Text { text: "UPPER PANEL"; color: "white"; anchors.centerIn: parent }
        }

        // Right Sidebar - Lower Section
        Rectangle {
            id: rightLower
            width: parent.width
            anchors.top: rightUpper.bottom
            anchors.bottom: parent.bottom

            border.color: "white"
            border.width: 1
            color: "#232323"

            Text { text: "LOWER PANEL"; color: "white"; anchors.centerIn: parent }
        }
    }

    // --- CENTRAL WORKSPACE ---
    Rectangle {
        id: workspace
        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: leftSide.right
        anchors.right: rightSide.left

        border.color: "white"
        border.width: 1
        color: "#232323"

        Text { text: "CENTRAL WORKSPACE"; color: "white"; anchors.centerIn: parent }
    }

    // --- FOOTER / BOTTOM PANEL ---
    Rectangle {
        id: footer
        property real heightPct: 10
        property real leftFooterWidthPct: 80

        width: parent.width
        height: mainWin.height * heightPct / 100
        anchors.bottom: parent.bottom

        border.color: "white"
        border.width: 1

        MouseArea {
            id: footerHandle
            width: parent.width
            height: 6
            anchors.top: parent.top
            cursorShape: Qt.SizeVerCursor
            hoverEnabled: true

            onPositionChanged: (mouse) => {
                if (footerHandle.pressed) {
                    let mousePosY = footerHandle.mapToItem(null, mouse.x, mouse.y).y
                    let calcHeight = mainWin.height - mousePosY

                    let minHeight = 10 * mainWin.height / 100
                    let maxHeight = 40 * mainWin.height / 100

                    if (calcHeight >= minHeight && calcHeight <= maxHeight) {
                        footer.heightPct = (calcHeight * 100) / mainWin.height
                    }
                }
            }
        }

        // Footer - Left Section
        Rectangle {
            id: footerLeft
            width: footer.width * footer.leftFooterWidthPct/100
            height: parent.height

            border.color: "white"
            border.width: 1
            color: "#232323"

            MouseArea {
                id: footerLeftHandle
                width: 5
                height: parent.height
                anchors.right: parent.right
                hoverEnabled: true
                cursorShape: Qt.SizeHorCursor

                onPositionChanged: (mouse) => {
                    if (footerLeftHandle.pressed) {
                        let mousePosx = footerLeftHandle.mapToItem(null, mouse.x, mouse.y).x

                        let minWidth = 10 * mainWin.width / 100
                        let maxWidth = 80 * mainWin.width / 100

                        if (mousePosx >= minWidth && mousePosx <= maxWidth) {
                            footer.leftFooterWidthPct = mousePosx * 100 / footer.width
                        }
                    }
                }
            }
            Text { text: "LEFT SECTION"; color: "white"; anchors.centerIn: parent }
        }

        // Footer - Right Section
        Rectangle {
            id: footerRight
            anchors.left: footerLeft.right
            anchors.right: parent.right
            height: parent.height

            border.color: "white"
            border.width: 1
            color: "#232323"

            Text { text: "RIGHT SECTION"; color: "white"; anchors.centerIn: parent }
        }
    }
}
