import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class HomeStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static const TextStyle categoryTitle = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static const TextStyle seeAll = TextStyle(
    color: GeneralColors.primaryColor,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle timerTitle = TextStyle(
    color: GeneralColors.hint,
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
