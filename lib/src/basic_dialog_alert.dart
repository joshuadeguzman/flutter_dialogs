// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/src/base_dialog_data.dart';
import 'package:flutter_dialogs/src/base_dialog.dart';

class BasicDialogAlertData extends BaseDialogData {
  BasicDialogAlertData({
    Widget title,
    Widget content,
    List<Widget> actions,
  }) : super(
          title: title,
          content: content,
          actions: actions,
        );
}

class BasicDialogAlert extends BaseDialog<AlertDialog, CupertinoAlertDialog> {
  BasicDialogAlert({
    this.title,
    this.content,
    this.actions,
    this.android,
    this.ios,
  });

  /// Represents appropriate [Widget] to display in title section.
  final Widget title;

  /// Represents appropriate [Widget] to display in content section.
  final Widget content;

  /// Represents appropriate list of [Widget]'s to display in actions section.
  final List<Widget> actions;

  /// Additional configuration on top of [BasicDialogAlertData]'s default configuration.
  final BaseDialogBuilder<BasicDialogAlertData> android;

  /// Additional configuration on top of [BasicDialogAlertData]'s default configuration.
  final BaseDialogBuilder<BasicDialogAlertData> ios;

  @override
  AlertDialog buildAndroidWidget(BuildContext context) {
    BasicDialogAlertData data;

    if (android != null) {
      data = android(context);
    }

    return AlertDialog(
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.actions ?? actions,
    );
  }

  @override
  CupertinoAlertDialog buildiOSWidget(BuildContext context) {
    BasicDialogAlertData data;

    if (ios != null) {
      data = ios(context);
    }

    return CupertinoAlertDialog(
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.actions ?? actions,
    );
  }
}
