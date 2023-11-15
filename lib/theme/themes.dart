import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    primaryIconTheme: const IconThemeData(
      color: MyColors.iconsColor,
      size: Dimens.iconsAppBarSize,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: const MaterialStatePropertyAll(MyColors.iconsColor),
      elevation: const MaterialStatePropertyAll(0),
      iconSize: const MaterialStatePropertyAll(Dimens.iconsAppBarSize),
    )),
    iconTheme: const IconThemeData(
      color: MyColors.iconsColor,
      size: Dimens.iconsAppBarSize,
    ),
  );
}
