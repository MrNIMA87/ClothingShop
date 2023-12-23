import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/profile_style.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarSinglePage(title: 'Invite Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.paddingBody / 2),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: const Color(0xff764abc),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                Assets.images.explore21.path,
                              ),
                            ),
                          ),
                        )),
                    title: Text(
                      'Nima Shamsi',
                      style: ProfileStyle.name.copyWith(fontSize: 15),
                    ),
                    subtitle: Text(
                      '702.555.0122',
                      style: ProfileStyle.bodyPrivacy.copyWith(fontSize: 13),
                    ),
                    trailing: Container(
                      width: Get.width / 8,
                      height: Get.height / 28,
                      decoration: const BoxDecoration(
                          color: GeneralColors.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          )),
                      child: const Center(
                        child: Text(
                          'Invite',
                          style: ProfileStyle.trailing,
                        ),
                      ),
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
