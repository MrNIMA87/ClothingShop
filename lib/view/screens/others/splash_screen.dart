import 'dart:async';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/splash_style.dart';
import 'package:clothing_shop/view/screens/others/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      //TODO: inja yek shart bezar age sabt nam bood bere be Home Page
      Get.off(() => const WelcomeScreen());
    });
    return Scaffold(
      backgroundColor: GeneralColors.bgColor,
      body: Padding(
        padding:  EdgeInsets.only(top:Get.height / 2.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                Assets.images.splash.path,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'NimaShasmi',
              style: SplashStyle.nameDeveloper,
            ),
          ],
        ),
      ),
    );
  }
}