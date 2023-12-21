import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:clothing_shop/view/widgets/profile/top_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/profile/choice.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
//TODO: Icon haro avaz kon va bejash image bezar noskhe ayandam. Yadet Nare To bayad Behtarin Beshi (:
  List<IconData> iconList = [
    Icons.location_history_rounded,
    Icons.credit_card_outlined,
    CupertinoIcons.square_list,
    Icons.settings_outlined,
    Icons.help_outline_outlined,
    Icons.privacy_tip_outlined,
    Icons.share_outlined,
    Icons.logout,
  ];
  //titles
  List<String> titleList = [
    'Your profile',
    'Payment Methods',
    'My Orders',
    'Settings',
    'Help Center',
    'Privacy Policy',
    'Invite Friends',
    'Log out',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarSinglePage(title: 'Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.bodyMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TopPageProfileScreen(),
            (Dimens.paddingBody * 1.5).height,
            ChoiceProfileScreen(
              iconList: iconList,
              titleList: titleList,
            )
          ],
        ),
      ),
    );
  }
}
