import 'package:flutter/material.dart';
import 'package:flutter_dialogs/basic_dialog.dart';
import 'package:flutter_dialogs/config.dart';
import 'package:flutter_dialogs/utils.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  // This widget is the root of your application.
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
  final FDConfig _config = FDConfig(FDPlatform.ALL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
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

  // TODO: Move to a base abstract class
  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return FDBasicDialog(
          config: _config,
          title: "Title",
          content: "Description",
          buttonTitle: "OK",
          onPressed: (dialog) {
            print(FDUtils.getHostPlatformOS());
            dialog.dismiss(context);
          },
        );
      },
    );
  }
}
