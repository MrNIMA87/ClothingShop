import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/textStyle/sgin_in_style.dart';
import 'package:clothing_shop/view/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';

class OtherSign extends StatelessWidget {
  OtherSign({super.key, required this.title});
  String title = '';
  List<String> icons = [
    Assets.icons.appleIcon.path,
    Assets.icons.googleIcon.path,
    Assets.icons.faceBookIcon.path,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          children: [
            //divider
            Text(
              title,
              style: SignInStyle.titleSignOtherPlatform,
              textAlign: TextAlign.center,
            ),
            (Dimens.bodyMargin * 2).height,
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width / 1.5,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage(icons[index]),
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
