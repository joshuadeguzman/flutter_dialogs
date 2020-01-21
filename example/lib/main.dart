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
                _showAlert(context);
              },
              child: const Text("Show Alert"),
            ),
            RaisedButton(
              onPressed: () {
                _showConfirmationAlert(context);
              },
              child: const Text("Show Confirmation Alert"),
            ),
            RaisedButton(
              onPressed: () {
                _showListAlert(context);
              },
              child: const Text("Show List Alert"),
            ),
          ],
        ),
      ),
    );
  }

  _showAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Current Location Not Available"),
        content:
            Text("Your current location cannot be determined at this time."),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _showConfirmationAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Discard draft?"),
        content: Text("Action cannot be undone."),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text("Discard"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _showListAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text("Select account"),
        content: Container(
          height: 200,
          child: ListView(
            children: <Widget>[
              _buildListSampleItem("contact@jdg.ph"),
              _buildListSampleItem("hello@gmail.com"),
              _buildListSampleItem("hi@joshuadeguzman.net"),
              _buildListSampleItem("jdeguzman@freelancer.com"),
            ],
          ),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListSampleItem(String title) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          CircleAvatar(),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
