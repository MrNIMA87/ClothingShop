import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class SingleProductStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle titleInfo = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle info = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: GeneralColors.hint,
    wordSpacing: 1,
    height: 1.2,
  );
  static const TextStyle infoColor = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: GeneralColors.hint,
    wordSpacing: 1,
    height: 1.2,
  );
}
