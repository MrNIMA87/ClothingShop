import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';

class WelcomeStyle {
  static const TextStyle nameApp = TextStyle(
    color: MyColors.primaryColor,
    fontFamily: 'Avenir_Bold',
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title = TextStyle(
    color: Colors.black,
    fontFamily: 'Avenir_Bold',
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle info = TextStyle(
    color: Color.fromARGB(134, 71, 60, 56),
    fontFamily: 'Avenir_Regular',
    fontSize: 19,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle infoSignIn = TextStyle(
    color: Colors.black,
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle signIn = TextStyle(
    color: MyColors.primaryColor,
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
