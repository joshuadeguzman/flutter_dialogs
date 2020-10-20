// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

abstract class BaseActionData {
  BaseActionData({
    this.onPressed,
    this.title,
  });

  /// Handles the [VoidCallback] whenever this action is pressed.
  final VoidCallback onPressed;

  /// Represents appropriate [Widget] to display in title section of this action.
  final Widget title;
}
