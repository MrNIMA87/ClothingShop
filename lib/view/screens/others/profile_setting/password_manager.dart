import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/general/forget_password.dart';
import 'package:clothing_shop/view/widgets/sgin/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_bar_single_page.dart';

class PasswordManager extends StatelessWidget {
  PasswordManager({super.key});
  TextEditingController currentPasswordController = TextEditingController();
  RxBool visiblePassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarSinglePage(title: 'Password Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.bodyMargin),
        child: Column(
          children: [
            //Current password
            Obx(
              () => SignInput(
                textEditingController: currentPasswordController,
                title: 'Password',
                hint: '****************',
                Icon: IconButton(
                  onPressed: () {
                    visiblePassword.value = !visiblePassword.value;
                    print(visiblePassword.value);
                  },
                  icon: Icon(
                    visiblePassword.value == true
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye_fill,
                  ),
                ),
                textInputType: TextInputType.visiblePassword,
                visiblePassword: visiblePassword.value.obs,
                emailChecker: false.obs,
              ),
            ),
            const ForgetPassword(),
            10.0.height,
            //Next Password
            Obx(
              () => SignInput(
                textEditingController: currentPasswordController,
                title: 'New Password',
                hint: '******************',
                Icon: IconButton(
                  onPressed: () {
                    visiblePassword.value = !visiblePassword.value;
                    print(visiblePassword.value);
                  },
                  icon: Icon(
                    visiblePassword.value == true
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye_fill,
                  ),
                ),
                textInputType: TextInputType.visiblePassword,
                visiblePassword: visiblePassword.value.obs,
                emailChecker: false.obs,
              ),
            ),
            (Dimens.bodyMargin + 1).height,
            Obx(
              () => SignInput(
                textEditingController: currentPasswordController,
                title: 'Confirm New Password',
                hint: '****************',
                Icon: IconButton(
                  onPressed: () {
                    visiblePassword.value = !visiblePassword.value;
                    print(visiblePassword.value);
                  },
                  icon: Icon(
                    visiblePassword.value == true
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye_fill,
                  ),
                ),
                textInputType: TextInputType.visiblePassword,
                visiblePassword: visiblePassword.value.obs,
                emailChecker: false.obs,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimens.paddingBody),
        child: ButtonSign(title: 'Change Password', onPressed: () {}),
      ),
    );
  }
}
