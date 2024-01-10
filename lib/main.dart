import 'package:clothing_shop/view/screens/mainScreens/main_screen.dart';
import 'package:clothing_shop/view/screens/others/splash_screen.dart';
import 'package:clothing_shop/view/screens/sign/sign_in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'theme/colors/general_colors.dart';
import "package:clothing_shop/theme/themes.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: GeneralColors.bgColor,
      systemNavigationBarColor: GeneralColors.bgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      home: SignIn(),
    );
  }
}
