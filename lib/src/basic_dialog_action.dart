// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/src/base_action_data.dart';
import 'package:flutter_dialogs/src/base_dialog.dart';

class BasicDialogActionData extends BaseActionData {
  BasicDialogActionData({
    VoidCallback? onPressed,
    Widget? title,
  }) : super(
          onPressed: onPressed,
          title: title,
        );
}

/// Widget class that holds the possible widgets to be shown in a [BaseDialog].
/// For example, [TextButton] for Android and [CupertinoDialogAction] for iOS.
class BasicDialogAction extends BaseDialog<TextButton, CupertinoDialogAction> {
  BasicDialogAction({
    this.onPressed,
    this.title,
    this.iosIsDestructiveAction = false,
    this.iosIsDefaultAction = false,
  });

  /// Handles the [VoidCallback] whenever an action is pressed.
  final VoidCallback? onPressed;

  /// Represents appropriate [Widget] to display in title section.
  /// For example, this can be a simple [Text] widget
  /// or a [Container] widget that contains a [Text] widget.
  final Widget? title;

  /// Whether this action destroys an object.
  ///
  /// For example, an action that deletes an email is destructive.
  ///
  /// Defaults to false and cannot be null.
  /// Only used on iOS
  final bool iosIsDestructiveAction;

  /// Set to true if button is the default choice in the dialog.
  ///
  /// Default buttons have bold text. Similar to
  /// [UIAlertController.preferredAction](https://developer.apple.com/documentation/uikit/uialertcontroller/1620102-preferredaction),
  /// but more than one action can have this attribute set to true in the same
  /// [CupertinoAlertDialog]
  ///
  /// This parameters defaults to false and cannot be null.
  /// Only used on iOS
  final bool iosIsDefaultAction;

  @override
  TextButton buildMaterialWidget(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: title ?? Container(),
    );
  }

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: title ?? Container(),
      isDestructiveAction: iosIsDestructiveAction,
      isDefaultAction: iosIsDefaultAction,
    );
  }
}
