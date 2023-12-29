import 'dart:async';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/splash_style.dart';
import 'package:clothing_shop/view/screens/mainScreens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.off(() => const WelcomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GeneralColors.bgColor,
      body: Padding(
        padding: EdgeInsets.only(top: Get.height / 2.4),
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
            Padding(
              padding: EdgeInsets.only(top: Get.height / 2.2),
              child: const Text(
                'NimaShasmi',
                style: SplashStyle.nameDeveloper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
