import 'package:clothing_shop/theme/shadow/text_shadow.dart';
import 'package:flutter/material.dart';

class GeneralTextStyle {
  static const TextStyle nameApp = TextStyle(
    fontFamily: 'Avenir_Bold',
    color: Colors.white,
    fontSize: 22,
    letterSpacing: 8,
    shadows: [AppTextShadow.splashShadow],
  );
  static const TextStyle textButton = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.white,
    fontSize: 22,
  );
}
