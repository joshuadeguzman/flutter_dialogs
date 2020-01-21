import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialogs Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _showDialog(context);
              },
              child: const Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Title"),
        content: Text("Content"),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Proceed"),
            onPressed: () {
              print("Current platform ${Platform.operatingSystem}");
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text("Cancel"),
            onPressed: () {
              print("Current platform ${Platform.operatingSystem}");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
