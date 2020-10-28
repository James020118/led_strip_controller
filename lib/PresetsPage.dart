import 'package:flutter/material.dart';
import 'BluetoothPage.dart';
import 'package:flutter_blue/flutter_blue.dart';

class PresetsPage extends StatefulWidget {
  @override
  _PresetsPageState createState() => _PresetsPageState();
}

class _PresetsPageState extends State<PresetsPage> {
  double _brightnessSliderValue = 50;
  double _lightIntensitySliderValue = 50;

  List<bool> _patternsSelected = [true, false, false];
  List<bool> _frequenciesSelected = [true, true, true, true, true, true, true];

  double _lightR = 0;
  double _lightG = 0;
  double _lightB = 0;

  void _togglePattern(int index) {
    for (int i = 0; i < 3; i++) {
      _patternsSelected[i] = false;
    }
    _patternsSelected[index] = true;
  }

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
            // -----------------------------------------------
            // Light Intensity selection
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Light Intensity"),
            ),
            Slider(
              value: _lightIntensitySliderValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: _lightIntensitySliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _lightIntensitySliderValue = value;
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
            // TODO: USE PRESET COLORS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Light Colors"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Red: $_lightR"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: _lightR,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _lightR.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _lightR = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Green: $_lightG"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: _lightG,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _lightG.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _lightG = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Blue: $_lightB"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: _lightB,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _lightB.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _lightB = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
