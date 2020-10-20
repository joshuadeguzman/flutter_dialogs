// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/src/base_action_data.dart';
import 'package:flutter_dialogs/src/base_dialog.dart';

class BasicDialogActionData extends BaseActionData {
  BasicDialogActionData({
    VoidCallback onPressed,
    Widget title,
  }) : super(onPressed: onPressed, title: title);
}

/// Widget class that holds the possible widgets to be shown in a [BaseDialog].
/// For example, [FlatButton] for Android and [CupertinoDialogAction] for iOS.
class BasicDialogAction extends BaseDialog<FlatButton, CupertinoDialogAction> {
  BasicDialogAction({
    this.onPressed,
    this.title,
  });

  /// Handles the [VoidCallback] whenever an action is pressed.
  final VoidCallback onPressed;

  /// Represents appropriate [Widget] to display in title section.
  /// For example, this can be a simple [Text] widget
  /// or a [Container] widget that contains a [Text] widget.
  final Widget title;

  @override
  FlatButton buildAndroidWidget(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: title ?? Container(),
    );
  }

  @override
  CupertinoDialogAction buildiOSWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: title ?? Container(),
    );
  }
}
