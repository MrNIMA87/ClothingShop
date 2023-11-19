import 'dart:developer';

import 'package:clothing_shop/constant/Strings/sign_up_strings.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/sign_up.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/sgin/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/Strings/sign_in_strings.dart';
import '../../../constant/dimens.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  RxBool visiblePassword = true.obs;
  RxBool acceptRules = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Title
              const Text(
                'Create Account',
                style: SignInStyle.title,
                textAlign: TextAlign.center,
              ),
              Dimens.bodyMargin.height,
              //Text Welcome
              const Text(
                SignUpStrings.info,
                style: SignInStyle.welcome,
                textAlign: TextAlign.center,
              ),
              (Dimens.bodyMargin * 2).height,
              //inputs
              Column(
                children: [
                  //name
                  SignInInput(
                    title: "Name",
                    hint: SignUpStrings.hintName,
                    textInputType: TextInputType.emailAddress,
                    visiblePassword: false.obs,
                  ),
                  //email
                  SignInInput(
                    title: "Email",
                    hint: SignUpStrings.hintEmail,
                    textInputType: TextInputType.emailAddress,
                    visiblePassword: false.obs,
                  ),
                  //password
                  Obx(
                    () => SignInInput(
                      title: "Password",
                      hint: '**********************',
                      textInputType: TextInputType.visiblePassword,
                      visiblePassword: true.obs,
                      Icon: IconButton(
                        onPressed: () {
                          visiblePassword.value = !visiblePassword.value;
                          print(visiblePassword.value);
                        },
                        icon: Icon(visiblePassword.value == true
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      activeColor: GeneralColors.primaryColor,
                      value: acceptRules.value,
                      onChanged: (value) {
                        acceptRules.value = value!;
                        print(acceptRules);
                      },
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: 'Agree with ',
                          style: SignUpStyle.title,
                        ),
                        TextSpan(
                          text: 'Terms & Condition',
                          style: SignUpStyle.forgetPassword,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ButtonSign(title: 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}
