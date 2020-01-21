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
  }) : super(
          onPressed: onPressed,
          title: title,
        );
}

class BasicDialogAction extends BaseDialog<FlatButton, CupertinoDialogAction> {
  BasicDialogAction({
    this.onPressed,
    this.title,
  });

  VoidCallback onPressed;
  Widget title;

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
