import 'package:flutter/material.dart';

class GeneralTextStyle {
  static const TextStyle nameApp = TextStyle(
      fontFamily: 'Avenir_Bold',
      color: Colors.white,
      fontSize: 22,
      letterSpacing: 8,
      shadows: <Shadow>[
        Shadow(
          color: Colors.white,
          offset: Offset(0,0),
          blurRadius: 10.0,
        )
      ]);
}
