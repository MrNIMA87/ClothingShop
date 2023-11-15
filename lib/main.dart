import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:clothing_shop/theme/themes.dart';
import 'package:clothing_shop/view/screens/main_screen.dart';
import 'package:clothing_shop/view/screens/splash_screen.dart';
import 'package:clothing_shop/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyColors.bgColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: MyColors.bgColor,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      home: const WelcomeScreen(),
    );
  }
}
