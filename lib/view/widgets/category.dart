import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  Category({
    super.key,
    required this.icon,
    required this.title,
  });
  final icon;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width / 8,
          height: Get.height / 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: const Color.fromARGB(255, 247, 242, 237),
          ),
          child: Center(
            child: ImageIcon(
              icon,
              color: GeneralColors.primaryColor,size: Get.height / 25,
            ),
          ),
        ),
        7.0.height,
        Text(
          title,
          style: HomeStyle.categoryTitle,
        )
      ],
    );
  }
}
