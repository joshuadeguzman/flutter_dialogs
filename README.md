# flutter_dialogs

A lightweight and platform-aware plugin for showing dialogs and alerts for both Android and iOS devices. Supports null-safety and Flutter 2.0.

## Features

- Platform aware
- Extendable widgets
- Lightweight < 28 KB

## Usage

Sample Alert
```
showPlatformDialog(
  context: context,
  builder: (context) => BasicDialogAlert(
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
```
Output

|iOS|Android|
|---|---|
|![ios-basic-dialog-alert](.github/basic_ios_alert.png)|![android-basic-dialog-alert](.github/basic_android_alert.png)|


Sample Confirmation
```
showPlatformDialog(
  context: context,
  builder: (context) => BasicDialogAlert(
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
```
Output

|iOS|Android|
|---|---|
|![ios-basic-dialog-confirmation](.github/basic_ios_confirmation.png)|![android-basic-dialog-confirmation](.github/basic_android_confirmation.png)|

Sample List
```
showPlatformDialog(
  context: context,
  builder: (context) => BasicDialogAlert(
    title: Text("Select account"),
    content: Container(
      height: 200,
      child: ListView(
        children: <Widget>[
          _buildListSampleItem("joshua@joshuamdeguzman.com"),
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
```
Output

|iOS|Android|
|---|---|
|![ios-basic-dialog-list](.github/basic_ios_list.png)|![android-basic-dialog-list](.github/basic_android_list.png)|

## License

MIT [@joshuadeguzman](https://github.com/joshuadeguzman/flutter-dialogs/blob/master/LICENSE)
