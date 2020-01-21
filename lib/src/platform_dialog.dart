// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  androidBarrierDismissible = false,
}) {
  if (Platform.isAndroid) {
    return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: androidBarrierDismissible);
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
    );
  }
}
