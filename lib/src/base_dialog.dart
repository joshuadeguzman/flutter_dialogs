// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef T BaseDialogBuilder<T>(BuildContext context);

abstract class BaseDialog<A extends Widget, I extends Widget>
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return buildMaterialWidget(context);
    } else {
      final platform = Theme.of(context).platform;

      switch (platform) {
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
        case TargetPlatform.android:
          return buildMaterialWidget(context);
        case TargetPlatform.macOS:
        case TargetPlatform.iOS:
          return buildCupertinoWidget(context);
        default:
          throw UnsupportedError("Platform is not supported by this plugin.");
      }
    }
  }

  A buildMaterialWidget(BuildContext context);

  I buildCupertinoWidget(BuildContext context);
}
