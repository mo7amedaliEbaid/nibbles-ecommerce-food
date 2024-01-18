import 'package:flutter/material.dart';

Widget customUnderLinedText(
  TextStyle? style,
  String text,
  bool isFromAuth,
) {
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
    textAlign: isFromAuth ? TextAlign.end : null,
  );
}
