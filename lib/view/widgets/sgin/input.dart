import 'dart:developer';

import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constant/Strings/sign_in_strings.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/general_style.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class SignInput extends StatelessWidget {
  SignInput({
    super.key,
    required this.title,
    required this.hint,
    required this.textInputType,
    required this.visiblePassword,
    this.Icon,
    required this.textEditingController,
    required this.emailChecker,
  });
  final title;
  final hint;
  final Icon;
  final TextEditingController textEditingController;
  TextInputType textInputType;
  RxBool emailChecker;
  RxBool visiblePassword;
  RxString? valueInput;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.maxFinite,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: SignInStyle.titleTextField,
            )),
        10.0.height,
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          width: double.maxFinite,
          height: Get.height / 14,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: GeneralColors.borderInput,
            ),
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: Center(
            child: TextField(
              controller: textEditingController,
              obscureText: visiblePassword.value,
              keyboardType: textInputType,
              autocorrect: true,
              onChanged: (value) {
                valueInput?.value = value.toString();
                log(valueInput!.value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: GeneralTextStyle.hint,
                suffixIcon: Icon,
                suffixIconColor: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
