import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';

class SignInStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 35,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle welcome = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: GeneralColors.infoColor,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: GeneralColors.hint,
  );
  static const TextStyle titleTextField = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle forgetPassword = TextStyle(
    color: GeneralColors.primaryColor,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle titleSignOtherPlatform = TextStyle(
    color: Colors.grey,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}
