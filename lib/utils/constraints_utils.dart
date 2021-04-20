import 'dart:math';

import 'package:flutter/widgets.dart';

extension BoxConstraintsExt on BoxConstraints {
  BoxConstraints preferTo({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    minWidth = min(minWidth, maxWidth);
    maxWidth = max(minWidth, maxWidth);
    minHeight = min(minHeight, maxHeight);
    maxHeight = max(minHeight, maxHeight);

    return BoxConstraints(
      minWidth: max(this.minWidth, minWidth),
      maxWidth: min(this.maxWidth, maxWidth),
      minHeight: max(this.minHeight, minHeight),
      maxHeight: min(this.maxHeight, maxHeight),
    );
  }
}
