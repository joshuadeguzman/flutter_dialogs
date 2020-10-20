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

  /// Represents appropriate [Widget] to display in content section.
  final Widget content;

  /// Represents appropriate [Widget] to display in title section.
  final Widget title;

  /// Represents appropriate list of [Widget]'s to display in actions section.
  final List<Widget> actions;
}
