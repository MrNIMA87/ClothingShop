import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: Dimens.bodyMargin /2),
        height: Get.height / 25,
        width: Get.width / 2.6,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: GeneralColors.primaryColor,
        ))),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Forget Password?',
            style: SignInStyle.forgetPassword,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
