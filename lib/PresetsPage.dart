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
  double _brightnessSliderValue = 50;

  List<bool> _patternsSelected = [true, false, false];
  List<bool> _frequenciesSelected = [true, false, false, false, false, false, false];
  String currentLightCorlor = "BLUE";

  void _togglePattern(int index) {
    for (int i = 0; i < 3; i++) {
      _patternsSelected[i] = false;
    }
    _patternsSelected[index] = true;
  }

  void _toggleFrequency(int index) {
    for (int i = 0; i < 7; i++) {
      _frequenciesSelected[i] = false;
    }
    _frequenciesSelected[index] = true;
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Brightness selection
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Brightness"),
              ),
              Slider(
                value: _brightnessSliderValue,
                min: 0,
                max: 100,
                divisions: 5,
                label: _brightnessSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _brightnessSliderValue = value;
                  });
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
                    color: _patternsSelected[0] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _togglePattern(0);
                      });
                    },
                    child: Text("Pattern 1"),
                  ),
                  // Pattern 2: ____
                  RaisedButton(
                    color: _patternsSelected[1] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _togglePattern(1);
                      });
                    },
                    child: Text("Pattern 2"),
                  ),
                  // Pattern 3: ____
                  RaisedButton(
                    color: _patternsSelected[2] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _togglePattern(2);
                      });
                    },
                    child: Text("Pattern 3"),
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
                    color: _frequenciesSelected[0] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(0);
                      });
                    },
                    child: Text("63Hz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[1] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(1);
                      });
                    },
                    child: Text("160Hz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[2] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(2);
                      });
                    },
                    child: Text("400Hz"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: _frequenciesSelected[3] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(3);
                      });
                    },
                    child: Text("1kHz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[4] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(4);
                      });
                    },
                    child: Text("2.5kHz"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: _frequenciesSelected[5] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(5);
                      });
                    },
                    child: Text("6.25kHz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[6] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _toggleFrequency(6);
                      });
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
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "BLUE";
                      });
                    },
                    child: Text("Blue"),
                  ),
                  RaisedButton(
                    color: Color(0xFF008000),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "GREEN";
                      });
                    },
                    child: Text("Green"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF69B4),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "HOT PINK";
                      });
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
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "ORANGE";
                      });
                    },
                    child: Text("Orange"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF0000),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "RED";
                      });
                    },
                    child: Text("Red"),
                  ),
                  RaisedButton(
                    color: Color(0xFF800080),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "PURPLE";
                      });
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
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "YELLOW";
                      });
                    },
                    child: Text("Yellow"),
                  ),
                  RaisedButton(
                    color: Color(0xFF40E0D0),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "TURQUOISE";
                      });
                    },
                    child: Text("Turquoise"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF00FF),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "FUCHSIA";
                      });
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
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "GOLD";
                      });
                    },
                    child: Text("Gold"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFA8072),
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "SALMON";
                      });
                    },
                    child: Text("Salmon"),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        currentLightCorlor = "RAINBOW";
                      });
                    },
                    child: Text("Rainbow"),
                  ),
                ],
              ),

              // -------------------------------------------------
              // the textfield to control onboard led
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        val = value;
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text("Send"),
                    onPressed: () async {
                      if (globals.bluetoothCharacteristic != null) {
                        await globals.bluetoothCharacteristic.write(utf8.encode(val), withoutResponse: true);
                        print("Data transmission successful....");
                        List<int> value = await globals.bluetoothCharacteristic.read();
                        print(value);
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
