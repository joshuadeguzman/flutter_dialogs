// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

abstract class BaseDialogData {
  BaseDialogData({
    this.title,
    this.content,
    this.actions,
  });

  final Widget content;
  final Widget title;
  final List<Widget> actions;
}