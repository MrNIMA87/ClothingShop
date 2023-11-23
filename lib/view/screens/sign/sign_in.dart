import 'package:clothing_shop/constant/Strings/sign_in_strings.dart';
import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/sgin_in_style.dart';
import 'package:clothing_shop/view/screens/sign/verify_screen.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/sgin/input.dart';
import 'package:clothing_shop/view/widgets/sgin/sgin_with_other_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  RxBool visiblePassword = true.obs;
  TextEditingController? emailTextEditingController;
  TextEditingController? passwordTextEditingController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  style: SignInStyle.title,
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
                      textEditingController: emailTextEditingController!,
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
                        textEditingController: passwordTextEditingController!,
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
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width / 2, bottom: Dimens.bodyMargin, top: 8),
                  child: Container(
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
                ),
                //button SignIn
                ButtonSign(
                  title: 'Sign In',
                  onPressed: () {
                    Get.to(VerifyCodeScreen());
                  },
                ),
                //LOGIN WITH OTHER PLATFORM
                //TODO:  OtherSign(title: 'Or sign in with')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
