# flutter_dialogs
Platform aware dialog and alert widgets.
> NOTE: This is still in technical preview


### Features

- Platform aware dialog and alert widgets
- Ready to use dialogs with common UX/UI patterns
- Extendable components for custom platform-aware dialog and alert widgets

### Configuration

|Name|Description|Options
|---|---|---|
|`FDPlatform`|Forces the dialog to adapt to a specified platform design language, and disregard current host OS.|`ANDROID_ONLY`,<br>`IOS_ONLY`,<br>`ALL`|

### Basic Components

|Name|Parameters|
|---|---|
|`FDBasicDialog`|`String` title,<br>`String` content,<br>`String` buttonTitle,<br>`Function` onPressed|
|More coming out soon!||

### Extendable Components

|Name|Parameters|
|---|---|
|More coming out soon!||

### Basic Usage

1. Declare an `FDConfig`.

```dart
FDConfig _config = FDConfig(FDPlatform.ALL);
```

2. Present the dialog via `showDialog`.

```dart
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
                    // Print host OS
                    print(FDUtils.getHostPlatformOS());

                    // Dismiss dialog
                    dialog.dismiss(context);
                },
            );
        },
    );
}
```

### Contributing

1. [Fork the repo](<https://github.com/joshuadeguzman/flutter-dialogs/fork>).
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

### License

flutter_dialogs is released under the GNU General Public License v3.0. See [LICENSE](https://github.com/joshuadeguzman/flutter-dialogs/blob/master/LICENSE) for details.