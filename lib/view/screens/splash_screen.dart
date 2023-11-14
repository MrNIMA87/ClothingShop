import 'package:clothing_shop/constant/my_strings.dart';
import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Text(
          MyStrings.nameApp,
          style: GeneralTextStyle.nameApp,
        ),
      ),
    );
  }
}
