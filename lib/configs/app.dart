import 'package:flutter/material.dart';

import 'space.dart';
import 'app_typography.dart';
import 'app_dimensions.dart';
import 'ui.dart';

class App {
  static bool? isLtr;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
