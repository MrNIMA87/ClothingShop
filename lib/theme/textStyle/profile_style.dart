import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class ProfileStyle {
  static const TextStyle name = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static const TextStyle titleList = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );
  static const TextStyle selectedTopCategory = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: GeneralColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle notSelectedTopCategory = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.black38,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle titleFAQ = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle bodyFAQ = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.black45,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  //Privacy Policy Styles
  static const TextStyle titlePrivacy = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: GeneralColors.primaryColor,
  );
  static const TextStyle bodyPrivacy = TextStyle(
    fontFamily: 'Avenir_Regular',
    color: Colors.black45,
    fontSize: 15,
    height: 1.2,
    fontWeight: FontWeight.w600,
  );
  //Invite
  static const TextStyle trailing = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
