import 'package:flutter/material.dart';

import '../../configs/app_typography.dart';

Widget customUndelinedText(TextStyle? style, String text) {
  return Text(
    text,
    style: style?.copyWith(
      shadows: [const Shadow(color: Colors.black, offset: Offset(0, -4))],
      color: Colors.transparent,
      decorationColor: Colors.black,
      letterSpacing: .5,
      decoration: TextDecoration.underline,
      decorationThickness: 3.5,
    ),
  );
}
