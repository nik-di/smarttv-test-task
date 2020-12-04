Activity {
    id: filmsMenu;
    name: "films-menu";

    property variant filmsArr: [];
    property string activityTitle: '';

    function _openFile(fileUrl) {
        const request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    function _setFilmsActivityData() {
        const dataJSON = this._openFile($manifest$dataDirectory);
        const {title, items} = JSON.parse(dataJSON);
        this.filmsArr.push(...items);
        this.activityTitle = title;
    }

    function _cutTitle(text) {
        const MAX_TITLE_LENGTH = 30;
        return text.length > MAX_TITLE_LENGTH ? 
            (text.substr(0, MAX_TITLE_LENGTH) + "...") :
            text;
    }

    onCompleted: {
        this._setFilmsActivityData();
        this.filmsArr.forEach(film => {
            const listItem = {};
            listItem.title = this._cutTitle(film.title);
            filmsListModel.append(listItem);
        });
    }

    ListView {
		width: contentWidth;
		height: contentHeight;
		spacing: 5;
        z: 1;
        anchors.centerIn: parent;
		
        model: ListModel {
            id: filmsListModel;
        }

		delegate: Rectangle {
			width: 270;
			height: 30;
			color: "black";
            focus: true;
            border.width: 2;
            border.color: activeFocus ? "red" : "black";

			Text {
                width: 100%;
				id: listItemText;
				anchors.centerIn: parent;
                anchors.leftMargin: -20;
				text: model.title;
				color: "white";
			}
            // Fu...
            onClicked: {
                console.log('Clck');
            }
		}

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
            text: filmsMenu.activityTitle;
        }
    }

    Rectangle {
        width: parent.width;
        height: parent.height;
        color: "black";
    }

    WebItem {
        y: 10;
        x: 10;
        width: 100;
        height: 45;
        color: "black";
        effects.shadow.color: "red";
        effects.shadow.blur: 7;
        effects.shadow.spread: hover ? 4 : 2;
        radius: 5;

        Text {
            width: 100%;
            height: 100%;
            color: "white";
            font.pixelSize: 20;
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;
            text: "Выход";
        }

        onClicked: {
            filmsMenu.pop(1);
        }
    }

}