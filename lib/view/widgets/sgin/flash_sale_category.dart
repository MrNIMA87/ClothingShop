import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashSaleCategory extends StatelessWidget {
  FlashSaleCategory({super.key, required this.titleCategory});

  RxList titleCategory = [].obs;
  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height / 14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: titleCategory.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedIndex.value = index;
            },
            child: Obx(
              () => Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                    borderRadius:  const BorderRadius.all(Radius.circular(32)),
                    color: selectedIndex == index
                        ? GeneralColors.primaryColor
                        : GeneralColors.onSelectedCategory,
                ),
                child: Center(
                  child: Text(
                    titleCategory[index],
                    style: selectedIndex == index
                        ? HomeStyle.flashSaleCategoryTitleOntSelected
                        : HomeStyle.flashSaleCategoryTitleNotSelected,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
