import 'package:flutter/material.dart';
import 'BluetoothPage.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'globals.dart' as globals;
import 'dart:convert';

class PresetsPage extends StatefulWidget {
  @override
  _PresetsPageState createState() => _PresetsPageState();
}

class _PresetsPageState extends State<PresetsPage> {
  double brightnessSliderValue = 60;

  List<bool> patternsSelected = [true, false, false];
  List<bool> frequenciesSelected = [true, false, false, false, false, false, false];
  String currentLightCorlor = "BLUE";

  void _togglePattern(int index) {
    for (int i = 0; i < 3; i++) {
      patternsSelected[i] = false;
    }
    patternsSelected[index] = true;
  }

  void _toggleFrequency(int index) {
    for (int i = 0; i < 7; i++) {
      frequenciesSelected[i] = false;
    }
    frequenciesSelected[index] = true;
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
  }

  String val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Presets"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                icon: Icon(Icons.bluetooth),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BluetoothPage()));
                }),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Brightness selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Brightness"),
          ),
          Slider(
            value: brightnessSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: brightnessSliderValue.round().toString(),
            onChanged: (value) {
              setState(() {
                brightnessSliderValue = value;
              });
            },
            onChangeEnd: (value) async {
              setState(() {
                brightnessSliderValue = value;
              });
              if (globals.bluetoothCharacteristic != null) {
                int _temp = value.round();
                switch (_temp) {
                  case 0:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'a');
                    break;
                  case 20:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'b');
                    break;
                  case 40:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'c');
                    break;
                  case 60:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'd');
                    break;
                  case 80:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'e');
                    break;
                  case 100:
                    globals.lightData = replaceCharAt(globals.lightData, 0, 'f');
                    break;
                  default:
                    break;
                }
                await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
              }
            },
          ),
          // ----------------------------------------------
          // Light Patterns
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Light Patterns"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Pattern 1: ____
              RaisedButton(
                color: patternsSelected[0] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _togglePattern(0);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 1, '0');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Spiral"),
              ),
              // Pattern 2: ____
              RaisedButton(
                color: patternsSelected[1] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _togglePattern(1);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 1, '1');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Reactive"),
              ),
              // Pattern 3: ____
              RaisedButton(
                color: patternsSelected[2] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _togglePattern(2);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 1, '2');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Rainbow"),
              ),
            ],
          ),
          // ------------------------------------------------
          // Band Frequencies
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Band Frequencies"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: frequenciesSelected[0] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(0);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '3');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("63Hz"),
              ),
              RaisedButton(
                color: frequenciesSelected[1] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(1);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '4');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("160Hz"),
              ),
              RaisedButton(
                color: frequenciesSelected[2] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(2);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '5');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("400Hz"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: frequenciesSelected[3] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(3);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '6');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("1kHz"),
              ),
              RaisedButton(
                color: frequenciesSelected[4] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(4);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '7');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("2.5kHz"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: frequenciesSelected[5] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(5);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '8');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("6.25kHz"),
              ),
              RaisedButton(
                color: frequenciesSelected[6] ? Colors.blue : Colors.grey,
                onPressed: () async {
                  setState(() {
                    _toggleFrequency(6);
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 2, '9');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("16kHz"),
              ),
            ],
          ),
          // -------------------------------------------------
          // Light Colors
          // Preset Colors:
          // Blue, Green, Hot Pink
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Light Colors"),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Current Light Color: $currentLightCorlor"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Color(0xFF0000FF),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "BLUE";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'A');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Blue"),
              ),
              RaisedButton(
                color: Color(0xFF008000),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "GREEN";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'B');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Green"),
              ),
              RaisedButton(
                color: Color(0xFFFF69B4),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "HOT PINK";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'C');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Hot Pink"),
              ),
            ],
          ),

          // Preset Colors:
          // Orange, Red, Purple
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Color(0xFFFFA500),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "ORANGE";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'D');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Orange"),
              ),
              RaisedButton(
                color: Color(0xFFFF0000),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "RED";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'E');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Red"),
              ),
              RaisedButton(
                color: Color(0xFF800080),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "PURPLE";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'F');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Purple"),
              ),
            ],
          ),

          // Preset Colors:
          // Yellow, Turquoise, Fuchsia,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Color(0xFFFFFF00),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "YELLOW";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'G');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Yellow"),
              ),
              RaisedButton(
                color: Color(0xFF40E0D0),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "TURQUOISE";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'H');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Turquoise"),
              ),
              RaisedButton(
                color: Color(0xFFFF00FF),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "FUCHSIA";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'I');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Fuchsia"),
              ),
            ],
          ),

          // Preset Colors:
          // Gold, Salmon, Rainbow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Color(0xFFFFD700),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "GOLD";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'J');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Gold"),
              ),
              RaisedButton(
                color: Color(0xFFFA8072),
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "SALMON";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'K');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Salmon"),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () async {
                  setState(() {
                    currentLightCorlor = "RAINBOW";
                  });
                  if (globals.bluetoothCharacteristic != null) {
                    globals.lightData = replaceCharAt(globals.lightData, 3, 'L');
                    await globals.bluetoothCharacteristic.write(utf8.encode(globals.lightData), withoutResponse: true);
                  }
                },
                child: Text("Rainbow"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
