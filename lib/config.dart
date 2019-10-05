// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

enum FDPlatform {
  ANDROID_ONLY,
  IOS_ONLY,
  // FUCHSIA_ONLY,
  ALL
}

class FDConfig {
  final FDPlatform platform;

  FDConfig(this.platform);
}
