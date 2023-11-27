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
          width: Get.width / 7,
          height: Get.height / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: Colors.grey[200],
          ),
          child: Center(
            child: ImageIcon(
              icon,
              color: GeneralColors.primaryColor,
            ),
          ),
        ),
        5.0.height,
        Text(
          title,
          style: HomeStyle.categoryTitle,
        )
      ],
    );
  }
}
