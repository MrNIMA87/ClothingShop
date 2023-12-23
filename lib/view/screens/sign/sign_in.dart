import 'package:clothing_shop/constant/Strings/sign_in_strings.dart';
import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/sgin_in_style.dart';
import 'package:clothing_shop/view/screens/sign/verify_screen.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/sgin/input.dart';
import 'package:clothing_shop/view/widgets/sgin/sgin_with_other_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/general/forget_password.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  RxBool visiblePassword = true.obs;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: GeneralColors.bgColor,
          body: Padding(
            padding: const EdgeInsets.all(Dimens.paddingBody),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Title
                  const Text(
                    'Sign in',
                    style: GeneralTextStyle.title,
                    textAlign: TextAlign.center,
                  ),
                  Dimens.bodyMargin.height,
                  //Text Welcome
                  const Text(
                    SignInStrings.welcome,
                    style: SignInStyle.welcome,
                  ),
                  (Dimens.bodyMargin * 2).height,
                  //inputs
                  Column(
                    children: [
                      //Input Email
                      SignInput(
                        textEditingController: emailTextEditingController,
                        title: 'Email',
                        hint: SignInStrings.hintTextEmail,
                        Icon: const Icon(Icons.email_outlined),
                        textInputType: TextInputType.emailAddress,
                        visiblePassword: false.obs,
                        emailChecker: false.obs,
                      ),
                      20.0.height,
                      //Input Password
                      Obx(
                        () => SignInput(
                          textEditingController: passwordTextEditingController,
                          title: 'Password',
                          hint: '******************',
                          Icon: IconButton(
                            onPressed: () {
                              visiblePassword.value = !visiblePassword.value;
                              print(visiblePassword.value);
                            },
                            icon: Icon(visiblePassword.value == true
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye_fill),
                          ),
                          textInputType: TextInputType.visiblePassword,
                          visiblePassword: visiblePassword.value.obs,
                          emailChecker: false.obs,
                        ),
                      ),
                    ],
                  ),
                 const ForgetPassword(),
                  //button SignIn
                  ButtonSign(
                    title: 'Sign In',
                    onPressed: () {
                      Get.to(VerifyCodeScreen());
                    },
                  ),
                  //LOGIN WITH OTHER PLATFORM
                   OtherSign(title: 'Or sign in with')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
