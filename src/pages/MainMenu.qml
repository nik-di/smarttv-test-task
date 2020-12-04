Activity {
    id: mainMenu;
    name: "main-menu";

    Rectangle {
        width: parent.width;
        height: parent.height;
        color: "black";
    }

    Rectangle {
        y: 15;
        width: 200;
        height: 50;
        color: "black";
        anchors.horizontalCenter: parent.horizontalCenter;
        z: 2;

        Text {
            id: pageTitle;
            width: 100%;
            height: 100%;
            color: "white";
            font.pixelSize: 28;
            font.weight: 600;
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;
            text: "SmartTV";
        }
    }

    Column {
        width: 150;
        spacing: 50;
        anchors.centerIn: parent;

        WebItem {
            width: 150;
            height: 70;
            color: "black";
            effects.shadow.color: "red";
            effects.shadow.blur: hover ? 13 : 10;
            effects.shadow.spread: hover ? 6 : 3;
            radius: 5;
            focus: true;

            Text {
                width: 100%;
                height: 100%;
                color: "white";
                font.pixelSize: 20;
                verticalAlignment: Text.AlignVCenter;
                horizontalAlignment: Text.AlignHCenter;
                text: "Начать";
            }

            onClicked: {
                manager.push("films-menu");
            }

    	}

        WebItem {
            width: 150;
            height: 70;
            color: "black";
            effects.shadow.color: "red";
            effects.shadow.blur: hover ? 13 : 10;
            effects.shadow.spread: hover ? 6 : 3;
            radius: 5;
            focus: true;

            Text {
                width: 100%;
                height: 100%;
                color: "white";
                font.pixelSize: 20;
                verticalAlignment: Text.AlignVCenter;
                horizontalAlignment: Text.AlignHCenter;
                text: "Выход";
    		}
	    }
    }

}