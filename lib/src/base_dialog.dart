// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        case TargetPlatform.android:
          return buildMaterialWidget(context);
        case TargetPlatform.iOS:
          return buildiOSWidget(context);
        default:
          throw UnsupportedError("Platform is not supported by this plugin.");
      }
    }
  }

  A buildMaterialWidget(BuildContext context);

  I buildiOSWidget(BuildContext context);
}
