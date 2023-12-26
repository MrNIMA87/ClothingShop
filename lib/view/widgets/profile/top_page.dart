import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/textStyle/profile_style.dart';

class TopPageProfileScreen extends StatelessWidget {
  const TopPageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: Get.width / 4,
            height: Get.height / 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.images.explore22.path),
                fit: BoxFit.cover,
              ),
            ),
            //Icon pen for edit profile image
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: Get.width / 12,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      color: GeneralColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.create_rounded,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          15.0.height,
          const Text(
            'Esther Howard',
            style: ProfileStyle.name,
          )
        ],
      ),
    );
  }
}
