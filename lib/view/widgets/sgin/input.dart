import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/Strings/sign_in_strings.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class SignInInput extends StatelessWidget {
  SignInInput({
    super.key,
    required this.title,
    required this.hint,
    required this.textInputType,
    required this.visiblePassword,
    this.Icon,
  });
  final title;
  final hint;
  final Icon;
  TextInputType textInputType;
  RxBool visiblePassword;
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
            child: 
               TextField(
                obscureText: visiblePassword.value,
                keyboardType: textInputType,
                autocorrect: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: SignInStyle.hint,
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
