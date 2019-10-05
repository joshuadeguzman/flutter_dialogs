// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/config.dart';
import 'package:flutter_dialogs/utils.dart';

class FDBasicDialog extends StatefulWidget {
  final FDConfig config;
  final String title;
  final String content;
  final String buttonTitle;
  final Function(FDBasicDialog) onPressed;

  const FDBasicDialog(
      {Key key,
      this.config,
      this.title,
      this.content,
      this.buttonTitle,
      this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FDBasicDialogState();
  }

  // TODO: Move to a base abstract class
  void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class FDBasicDialogState extends State<FDBasicDialog> {
  FDConfig get _config => widget.config;
  String get _title => widget.title;
  String get _content => widget.content;
  String get _buttonTitle => widget.buttonTitle;
  Function(FDBasicDialog) get _onPressed => widget.onPressed;

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }

  Widget _buildDialog(BuildContext context) {
    if (_config.platform == FDPlatform.ANDROID_ONLY) {
      return _buildAndroidDialog();
    } else if (_config.platform == FDPlatform.IOS_ONLY) {
      return _buildIosDialog();
    } else {
      // TODO: Make "android" and "iOS" type safe
      if (FDUtils.getHostPlatformOS() == "ios") {
        return _buildIosDialog();
      } else {
        return _buildAndroidDialog();
      }
    }
  }

  Widget _buildAndroidDialog() {
    return AlertDialog(
      title: Text(_title),
      content: Text(_content),
      actions: <Widget>[
        FlatButton(
          child: Text(_buttonTitle),
          onPressed: () => _onPressed(widget),
        ),
      ],
    );
  }

  Widget _buildIosDialog() {
    return CupertinoAlertDialog(
      title: Text(_title),
      content: Text(_content),
      actions: <Widget>[
        FlatButton(
          child: Text(_buttonTitle),
          onPressed: () => _onPressed(widget),
        ),
      ],
    );
  }
}
