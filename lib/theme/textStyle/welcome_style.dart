import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';

class WelcomeStyle {
  static const TextStyle nameApp = TextStyle(
    color: GeneralColors.primaryColor,
    fontFamily: 'Avenir_Bold',
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    color: Colors.black,
    fontFamily: 'Avenir_Bold',
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle info = TextStyle(
    color: Color.fromARGB(134, 71, 60, 56),
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontFamily: 'Avenir_Regular',
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle infoSignIn = TextStyle(
    color: Colors.black,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle signIn = TextStyle(
    color: GeneralColors.primaryColor,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
}
