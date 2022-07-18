import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Dialogs Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _showAlert(context),
                child: const Text("Show Alert"),
              ),
              ElevatedButton(
                onPressed: () => _showConfirmationAlert(context),
                child: const Text("Show Confirmation Alert"),
              ),
              ElevatedButton(
                onPressed: () => _showListAlert(context),
                child: const Text("Show List Alert"),
              ),
            ],
          ),
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
        content: SingleChildScrollView(
          child: Container(
            height: 300,
            child: Column(
              children: <Widget>[
                _buildListItem("contact@jdg.ph"),
                _buildListItem("hello@gmail.com"),
                _buildListItem("hi@joshuadeguzman.net"),
                _buildListItem("jdeguzman@freelancer.com"),
              ],
            ),
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

  ListTile _buildListItem(String title) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(),
    );
  }
}
