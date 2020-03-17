import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Password Generator")


    // Random
    function getRandomLower() {
        return String.fromCharCode(Math.floor(Math.random() * 26) + 97);
    }

    function getRandomUpper() {
        return String.fromCharCode(Math.floor(Math.random() * 26) + 65);
    }

    function getRandomNumber() {
        return String.fromCharCode(Math.floor(Math.random() * 10) + 48);
    }

    function getRandomSyambol() {
        const sym= "!@#$%^&*()_+<>?:{}|~";
        return sym[Math.floor(Math.random() * sym.length)];
    }


    function shuffle(arr) {
        var i,j,temp;
        for (i = arr.length - 1; i > 0; i--) {
            j = Math.floor(Math.random() * (i + 1));
            temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
        return arr;
    }

    function generatorPassowrd(upper,lower,number,symbol,select) {
        const passlenght = Math.floor( slider.value );
        var modVal = passlenght % select;
        var divVal = passlenght / select;

        var passlist = []
        if(upper) {
            for(var i = 0; i<divVal;i++) {
                passlist.push(getRandomUpper());
            }
        }

        if(lower) {
            for(var y = 0; y<divVal;y++) {
                passlist.push(getRandomLower());
            }
        }

        if(number) {
            for(var z = 0; z<divVal;z++) {
                passlist.push(getRandomNumber());
            }
        }

        if(symbol) {
            for(var w = 0; w<divVal;w++) {
                passlist.push(getRandomSyambol());
            }
        }

        console.log(modVal);
        console.log(divVal);

        console.log( getRandomSyambol());
        console.log(passlist);
        console.log(shuffle(passlist).join(""));
        password.text = shuffle(passlist).join("");

    }

    Rectangle {
        id: appName
        width: parent.width
        height: 40
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            text: qsTr("PASSWORD GENERATOR TOOL")
            color: "red"

        }
    }
    TextField {
        id: password
        font.pixelSize: 30
        anchors.top: appName.bottom
        anchors.topMargin: 20
        anchors.left: appName.left
        anchors.leftMargin: 20
        anchors.right: appName.right
        anchors.rightMargin: 20
        width: parent.width * 0.7

    }


    Text {
        id: info
        anchors.top: password.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        text: qsTr("Customize your password")


    }
    RowLayout {
        id: main
        anchors.top: info.bottom
        anchors.fill: parent
        spacing: 30

        ColumnLayout {
            spacing: 10
            Text {
                id: hello
                text: qsTr("Password Length")
                font.pixelSize: 15
            }

            Row {
                spacing: 10
                Rectangle {
                    id: passBox
                    width: 50 ; height: 50
                    border.color: "lightsteelblue"
                    border.width: 4
                    radius: 8
                    Text {
                        id: name
                        text: Math.floor( slider.value );
                        anchors.centerIn: parent
                        font.pixelSize: 15
                    }

                }
            }

            Slider {
                id: slider
                from: 7
                value: 10
                to: 40
                onMoved:  {
                    console.log(slider.value);
                    var selectval = firstThree.checked ? 2 :3
                    generatorPassowrd(upperCase.checked,lowerCase.checked,number.checked,symbol.checked,selectval)

                }
            }
        }

        RowLayout {
            spacing: 30

            ColumnLayout {
                RadioButton {
                    id: firstTwo
                    checked: true
                    text: qsTr("1st Two")
                    onClicked:  {
                        upperCase.checked = true
                        lowerCase.checked = true
                        number.checked = false
                        symbol.checked = false
                        generatorPassowrd(upperCase.checked,lowerCase.checked,number.checked,symbol.checked,2)
                    }

                }
                RadioButton {
                    id: firstThree
                    text: qsTr("1st Three")
                    onClicked:  {
                        upperCase.checked = true
                        lowerCase.checked = true
                        number.checked = true
                        symbol.checked = false
                        generatorPassowrd(upperCase.checked,lowerCase.checked,number.checked,symbol.checked,3)
                    }
                }
                RadioButton {
                    id: all
                    text: qsTr("All")
                    onClicked:  {
                        upperCase.checked = true
                        lowerCase.checked = true
                        number.checked = true
                        symbol.checked = true
                        generatorPassowrd(upperCase.checked,lowerCase.checked,number.checked,symbol.checked,4)
                    }

                }
            }
        }
        RowLayout {
            spacing: 30

            ColumnLayout {
                CheckBox {
                    id: upperCase
                    text: qsTr("Uppercase")
                    checked: true
                }
                CheckBox {
                    id: lowerCase
                    text: qsTr("Lowercase")
                    checked: true
                }
                CheckBox {
                    id: number
                    text: qsTr("Numbers")
                }
                CheckBox {
                    id: symbol
                    text: qsTr("Symbols")
                }
            }
        }
    }

    Button {
        text: "Copy"
        x:330
        y:400

    }

}
