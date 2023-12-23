import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/view/screens/mainScreens/profile_screen.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/password_manager.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/privacy_policy.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/profile/choice.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  List<IconData> iconList = [
    Icons.location_history_rounded,
    Icons.key,
    Icons.credit_card_outlined
  ];
  //titles
  List<String> titleList = [
    'Notification Settings',
    'Password Manager',
    'Delete Account',
  ];
  //pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarSinglePage(title: 'Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.bodyMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: titleList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => PasswordManager());
                      print('Test');
                    },
                    child: ChoiceProfileScreen(
                      icon: iconList[index],
                      title: titleList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
