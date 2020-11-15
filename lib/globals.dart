library led_strip_controller.globals;

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

bool isConnected = false;
List<ScanResult> scanResult = [];
List<Color> textColors = [];
var connectedDevice;
var bluetoothCharacteristic;
