import 'dart:developer';

import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  String title = 'Title';
  String hint = 'Hint';
  final Icon;
   TextEditingController textEditingController = TextEditingController();
  TextInputType textInputType = TextInputType.text;
  RxBool emailChecker = false.obs;
  RxBool visiblePassword = false.obs;
  RxString valueInput = 'test'.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.maxFinite,
            //title
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: SignInStyle.titleTextField,
            )),
        10.0.height,
        //input
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          width: double.maxFinite,
          height: Get.height / 15,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: GeneralColors.borderInput,
            ),
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: TextField(
              controller: textEditingController,
              obscureText: visiblePassword.value,
              keyboardType: textInputType,
              autocorrect: true,
              onChanged: (value) {
                valueInput.value = value.toString();
                log(valueInput.value);
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
