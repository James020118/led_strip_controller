import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'globals.dart' as globals;

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();

    if (!globals.isConnected) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    if (!globals.isConnected) {
      setState(() {
        globals.scanResult.clear();
      });

      _startDiscovery();
    }
  }

  void _startDiscovery() {
    flutterBlue.startScan(timeout: Duration(seconds: 1));
    var subscription = flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        setState(() {
          if (!globals.scanResult.contains(r) && (r.device.name.isNotEmpty)) {
            globals.scanResult.add(r);
            globals.textColors.add(Colors.black);
          }
        });
      }
    });
    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovered devices"),
        actions: [
          IconButton(icon: Icon(Icons.replay), onPressed: _restartDiscovery),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: globals.scanResult.length,
          itemBuilder: (BuildContext context, index) {
            ScanResult result = globals.scanResult[index];
            return ListTile(
              title: Text(
                result.device.name ?? "Unknown device",
                style: TextStyle(
                  color: globals.textColors[index],
                ),
              ),
              leading: Icon(Icons.devices),
              onLongPress: () async {
                if (!globals.isConnected) {
                  print("started pairing process ...");
                  await result.device.connect();
                  print("pairing process succeeded ...");
                  setState(() {
                    globals.connectedDevice = result.device;
                    globals.textColors[index] = Colors.green;
                    globals.isConnected = true;
                  });
                } else {
                  print("started disconnecting process ...");
                  result.device.disconnect();
                  print("disconnecting process succeeded ...");
                  setState(() {
                    globals.connectedDevice = null;
                    globals.textColors[index] = Colors.black;
                    globals.isConnected = false;
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
