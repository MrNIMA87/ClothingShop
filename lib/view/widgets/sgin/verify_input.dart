import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyCodeTextField extends StatelessWidget {
  const VerifyCodeTextField({
    super.key,
    required this.otpFieldController,
  });

  final OtpFieldController otpFieldController;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
        controller: otpFieldController,
        length: 4,
        width: Get.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 60,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 22,
        style: const TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
        },
        onCompleted: (pin) {
          print("Completed: " + pin);
        });
  }
}
