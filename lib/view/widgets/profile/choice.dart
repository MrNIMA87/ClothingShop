import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/view/screens/mainScreens/profile_screen.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/help_center.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/invite_friend.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/privacy_policy.dart';
import 'package:clothing_shop/view/screens/others/profile_setting/stteings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/profile_style.dart';

class ChoiceProfileScreen extends StatelessWidget {
  ChoiceProfileScreen({super.key, required this.icon, required this.title});
//TODO: Icon haro avaz kon va bejash image bezar noskhe ayandam. Yadet Nare To bayad Behtarin Beshi (: bashe :)
  IconData icon = Icons.abc;
  //titles
  String title = '';
  //pages
  List<Widget> screens = [
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
    SettingScreen(),
    HelpCenterScreen(),
    const PrivacyPolicy(),
    const InviteFriendScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Icon and title
          Row(
            children: [
              Icon(
                icon,
                color: GeneralColors.primaryColor,
                size: 30,
              ),
              5.0.width,
              Text(
                title,
                style: ProfileStyle.titleList,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: GeneralColors.primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
