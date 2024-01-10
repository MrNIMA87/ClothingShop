import 'dart:math';

import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/verify_code_style.dart';
import 'package:clothing_shop/view/screens/mainScreens/main_screen.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:toastification/toastification.dart';
import '../../../constant/Strings/verify_code_strings.dart';
import '../../../constant/dimens.dart';
import '../../widgets/sgin/verify_input.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  OtpFieldController otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(88, 158, 158, 158),
                      width: 1.5,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 21,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.paddingBody),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Verify Code',
                    style: VerifyCodeStyle.title,
                    textAlign: TextAlign.center,
                  ),
                  Dimens.bodyMargin.height,
                  //Text Info
                  Column(
                    children: [
                      const Text(
                        VerifyCodeStrings.info,
                        style: VerifyCodeStyle.info,
                        textAlign: TextAlign.center,
                      ),
                      10.0.height,
                      const Text(
                        'email@gmail.com',
                        style: VerifyCodeStyle.resendCode,
                      )
                    ],
                  ),
                  (Dimens.bodyMargin * 1.5).height,
                  VerifyCodeTextField(otpFieldController: otpFieldController),
                  (Dimens.bodyMargin * 1.5).height,
                  Column(
                    children: [
                      const Text(
                        'Didn\'t recive OTP?',
                        style: VerifyCodeStyle.titleResendCode,
                      ),
                      //ResenCode
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: GeneralColors.primaryColor))),
                        child: TextButton(
                          onPressed: () {
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
                          },
                          child: const Text(
                            'Resend Code',
                            style: VerifyCodeStyle.resendCode,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Dimens.bodyMargin.height,
                  ButtonSign(
                    title: 'Verify',
                    onPressed: () {
                      Get.to(() => MainScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
