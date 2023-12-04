import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductCategory extends StatelessWidget {
  SingleProductCategory({super.key});

  List<String> titleCategory = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
  ];
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
              print(selectedIndex);
            },
            child: Obx(
              () => Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                    color: selectedIndex == index
                        ? GeneralColors.primaryColor
                        : GeneralColors.bgColor,
                    border: Border.all(
                      color: GeneralColors.borderInput,
                    )),
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
