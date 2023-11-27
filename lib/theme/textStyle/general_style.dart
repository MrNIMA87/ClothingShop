import 'package:clothing_shop/theme/shadow/text_shadow.dart';
import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class GeneralTextStyle {
  static const TextStyle nameApp = TextStyle(
    fontFamily: 'Avenir_Bold',
    color: Colors.white,
    fontSize: 22,
    letterSpacing: 8,
    shadows: [AppTextShadow.splashShadow],
  );
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 35,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle textButton = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.white,
    fontSize: 22,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: GeneralColors.hint,
  );
}
