import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    primaryIconTheme: const IconThemeData(
      color: GeneralColors.iconsColor,
      size: Dimens.iconsAppBarSize,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: const MaterialStatePropertyAll(GeneralColors.iconsColor),
      elevation: const MaterialStatePropertyAll(0),
      iconSize: const MaterialStatePropertyAll(Dimens.iconsAppBarSize),
    )),
    iconTheme: const IconThemeData(
      color: GeneralColors.iconsColor,
      size: Dimens.iconsAppBarSize,
    ),
  );
}
