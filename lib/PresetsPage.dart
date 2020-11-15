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
  List<bool> _frequenciesSelected = [true, true, true, true, true, true, true];

  void _togglePattern(int index) {
    for (int i = 0; i < 3; i++) {
      _patternsSelected[i] = false;
    }
    _patternsSelected[index] = true;
  }

  String val;
  //var bluetoothCharacteristic;

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
                divisions: 20,
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
                        _frequenciesSelected[0] = !_frequenciesSelected[0];
                      });
                    },
                    child: Text("63Hz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[1] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _frequenciesSelected[1] = !_frequenciesSelected[1];
                      });
                    },
                    child: Text("160Hz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[2] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _frequenciesSelected[2] = !_frequenciesSelected[2];
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
                        _frequenciesSelected[3] = !_frequenciesSelected[3];
                      });
                    },
                    child: Text("1kHz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[4] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _frequenciesSelected[4] = !_frequenciesSelected[4];
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
                        _frequenciesSelected[5] = !_frequenciesSelected[5];
                      });
                    },
                    child: Text("6.25kHz"),
                  ),
                  RaisedButton(
                    color: _frequenciesSelected[6] ? Colors.blue : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _frequenciesSelected[6] = !_frequenciesSelected[6];
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Color(0xFF0000FF),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Blue"),
                  ),
                  RaisedButton(
                    color: Color(0xFF008000),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Green"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF69B4),
                    onPressed: () {
                      setState(() {});
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
                      setState(() {});
                    },
                    child: Text("Orange"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF0000),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Red"),
                  ),
                  RaisedButton(
                    color: Color(0xFF800080),
                    onPressed: () {
                      setState(() {});
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
                      setState(() {});
                    },
                    child: Text("Yellow"),
                  ),
                  RaisedButton(
                    color: Color(0xFF40E0D0),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Turquoise"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFF00FF),
                    onPressed: () {
                      setState(() {});
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
                      setState(() {});
                    },
                    child: Text("Gold"),
                  ),
                  RaisedButton(
                    color: Color(0xFFFA8072),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Salmon"),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {});
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
                      }
                      print("Data transmission successful....");
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "--${globals.t}--",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
