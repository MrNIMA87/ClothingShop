
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/sgin_in_style.dart';

class EmailInput extends StatelessWidget {
  EmailInput({
    super.key,
  });

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            width: double.maxFinite,
            child: Text(
              'Email',
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: true,
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'nimashamsi1400@gmail.com',
                hintStyle: GeneralTextStyle.hint,
                suffixIconColor: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
