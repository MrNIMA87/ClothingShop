import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class VerifyCodeStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 35,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle info = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: GeneralColors.infoColor,
  );
  static const TextStyle titleResendCode = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: GeneralColors.infoColor,
  );
  static const TextStyle resendCode = TextStyle(
    color: GeneralColors.primaryColor,
    fontFamily: 'Avenir_Regular',
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
}
