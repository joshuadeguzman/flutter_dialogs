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
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _showAlert(context),
                  child: const Text("Show Alert"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _showConfirmationAlert(context),
                  child: const Text("Show Confirmation Alert"),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _showListAlert(context),
                  child: const Text("Show List Alert"),
                ),
              ],
            ),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildListItem("hi@example.com"),
              _buildListItem("joshua@joshuamdeguzman.com"),
              _buildListItem("joshua@flutter.ph"),
              _buildListItem("jdeguzman@freelancer.com"),
              _buildListItem("team@flutter.ph"),
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

  Widget _buildListItem(String title) {
    return Column(
      children: [
        Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text(title)),
            ],
          ),
        ),
        const Divider(height: 0.5),
      ],
    );
  }
}
