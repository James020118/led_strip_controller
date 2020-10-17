import 'package:flutter/material.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  bool _connected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetooth Connection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Devices"),
                ),
                Expanded(
                  child: DropdownButton(
                    items: _getDeviceItems(),
                    onChanged: (values) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RaisedButton(
                    child: _connected ? Text("Disconnect") : Text("Connect"),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> _getDeviceItems() {
    List<DropdownMenuItem> items = [];
    items.add(DropdownMenuItem(child: Text("None")));
    return items;
  }
}
