import 'package:clothing_shop/constant/Strings/sign_in_strings.dart';
import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/sgin_in_style.dart';
import 'package:clothing_shop/view/widgets/sgin_in/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  RxBool visiblePassword = true.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GeneralColors.bgColor,
        body: Center(
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
              //inputs
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: Dimens.bodyMargin, bottom: 30),
                child: Column(
                  children: [
                    //Input Email
                    SignInInput(
                      title: 'Email',
                      hint: SignInStrings.hintTextEmail,
                      Icon: const Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      visiblePassword: false.obs,
                    ),
                    20.0.height,
                    //Input Password
                    Obx(
                      () => SignInInput(
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: SizedBox(
                  width: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget Password?',
                      style: SignInStyle.forgetPassword,
                      textAlign: TextAlign.end,
                    ),
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
