import 'package:flutter/material.dart';

import '../colors/general_colors.dart';

class SingleProductStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle titleInfo = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle info = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: GeneralColors.hint,
    wordSpacing: 1,
    height: 1.2,
  );
  static const TextStyle infoColor = TextStyle(
    fontFamily: 'Avenir_Regular',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: GeneralColors.hint,
    wordSpacing: 1,
    height: 1.2,
  );
}
