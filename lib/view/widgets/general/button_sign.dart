import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSign extends StatelessWidget {
  ButtonSign({
    super.key,
    required this.title,
    required this.onPressed,
  });
  String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 14.5,
      decoration: const BoxDecoration(
        color: GeneralColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          elevation: MaterialStatePropertyAll(0.0),
        ),
        child: Text(
          title,
          style: GeneralTextStyle.textButton,
        ),
      ),
    );
  }
}
