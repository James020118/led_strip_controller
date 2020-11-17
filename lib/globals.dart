library led_strip_controller.globals;

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

// the String that communicates info about led strip
// default light data: a03A
String lightData = "d03A";

bool isConnected = false;
List<ScanResult> scanResult = [];
List<Color> textColors = [];
var connectedDevice;
var bluetoothCharacteristic;
