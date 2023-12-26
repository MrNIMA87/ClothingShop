import 'dart:math';

import 'package:clothing_shop/constant/Strings/sign_up_strings.dart';
import 'package:clothing_shop/constant/data_base/user_info.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/sign_up.dart';
import 'package:clothing_shop/view/screens/sign/verify_screen.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/sgin/email_input.dart';
import 'package:clothing_shop/view/widgets/sgin/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toastification/toastification.dart';
import '../../../constant/dimens.dart';
import '../../../theme/textStyle/general_style.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RxBool visiblePassword = true.obs;

  RxBool acceptRules = false.obs;
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimens.paddingBody,
                  right: Dimens.paddingBody,
                  top: Get.height / 7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Title
                    const Text(
                      'Create Account',
                      style: GeneralTextStyle.title,
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
                        SignInput(
                          title: "Name",
                          hint: SignUpStrings.hintName,
                          textInputType: TextInputType.emailAddress,
                          visiblePassword: false.obs,
                          textEditingController: TextEditingController(),
                          emailChecker: false.obs,
                        ),
                        (Dimens.bodyMargin / 2).height,
                        //email

                        EmailInput(),
                        (Dimens.bodyMargin / 2).height,

                        //password
                        Obx(
                          () => SignInput(
                            textEditingController:
                                passwordTextEditingController,
                            title: "Password",
                            hint: '**********************',
                            textInputType: TextInputType.visiblePassword,
                            visiblePassword: visiblePassword,
                            Icon: IconButton(
                              onPressed: () {
                                visiblePassword.value = !visiblePassword.value;
                              },
                              icon: Icon(visiblePassword.value == true
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye_fill),
                            ),
                            emailChecker: false.obs,
                          ),
                        ),
                      ],
                    ),
                    //Accept rules
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            activeColor: GeneralColors.primaryColor,
                            value: acceptRules.value,
                            onChanged: (value) {
                              acceptRules.value = value!;
                            },
                          ),
                        ),
                        //Text accept Rules
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
                        ),
                      ],
                    ),
                    ButtonSign(
                      title: 'Sign Up',
                      onPressed: () async {
                        await GetStorage().remove(UserInfo.email);
                        await GetStorage().write(
                            UserInfo.email, emailTextEditingController.text);
                        // ignore: use_build_context_synchronously
                        toastification.show(
                          context: context,
                          type: ToastificationType.info,
                          style: ToastificationStyle.fillColored,
                          title: Random().nextInt(9999).toString(),
                          alignment: Alignment.topCenter,
                          autoCloseDuration: const Duration(seconds: 10),
                          borderRadius: BorderRadius.circular(12.0),
                          backgroundColor: GeneralColors.primaryColor,
                          closeOnClick: false,
                          dragToClose: true,
                        );
                        Get.to(() => const VerifyCodeScreen());
                        //  await checkerEmailInput(emailInput.emailController.text);
                        //   checkerInput(
                        //     inputs.valueInput.toString(),
                        //     () => VerifyCodeScreen(),

                        //   );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
