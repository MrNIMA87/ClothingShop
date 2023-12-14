import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:clothing_shop/view/widgets/sgin/flash_sale_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../../theme/textStyle/general_style.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> category = [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Nike',
  ];

  List<String> genderCategory = [
    'All',
    'Man',
    'Woman',
  ];

  List<String> sortBy = [
    'Most Recent',
    'Popular',
    'Price High',
  ];
  List<String> titleRace = [
    '4.5 and above',
    '4.0-4.5',
    '3.5-4.0',
    '3.0-3.5',
    '2.5-3.0',
    '2.0-2.5',
    '1.5-2.0',
    '1.0-1.5',
    '0.5-1.0',
  ];
  RxDouble startPricingRange = 2.0.obs;
  RxInt selectedIndexReview = 0.obs;
  RxDouble endPricingRange = 20.0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarSinglePage(title: 'Filter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Dimens.bodyMargin),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Brands',
                    style: HomeStyle.categoryTitle.copyWith(fontSize: 17),
                  )),
              FlashSaleCategory(titleCategory: category.obs),
              15.0.height,
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gender',
                    style: HomeStyle.categoryTitle.copyWith(fontSize: 17),
                  )),
              FlashSaleCategory(titleCategory: genderCategory.obs),
              15.0.height,
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sort By',
                    style: HomeStyle.categoryTitle.copyWith(fontSize: 17),
                  )),
              FlashSaleCategory(titleCategory: sortBy.obs),
              15.0.height,
              //Pricing Range
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pricing Range',
                    style: HomeStyle.categoryTitle.copyWith(fontSize: 17),
                  )),
              Obx(
                () => RangeSlider(
                  values: RangeValues(
                      startPricingRange.value, endPricingRange.value),
                  labels: RangeLabels(
                    startPricingRange.value.round().toString(),
                    endPricingRange.value.round().toString(),
                  ),
                  onChanged: (value) {
                    startPricingRange.value = value.start;
                    endPricingRange.value = value.end;
                  },
                  activeColor: GeneralColors.primaryColor,
                  inactiveColor: GeneralColors.onSelectedCategory,
                  divisions: 11,
                  min: 1,
                  max: 150,
                ),
              ),
              //Reviews
              Expanded(
                child: ListView.builder(
                  itemCount: titleRace.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 115,
                          height: 50,
                          child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: const ShapeDecoration(
                                  shape: StarBorder(
                                    side: BorderSide(
                                      color: Colors.orange,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        //
                        Text(
                          titleRace[index],
                          style: HomeStyle.titleProduct.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        20.0.width,
                        InkWell(
                          onTap: () => selectedIndexReview.value = index,
                          child: Obx(
                            () => Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: GeneralColors.primaryColor,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Visibility(
                                  visible: selectedIndexReview.value == index
                                      ? true
                                      : false,
                                  child: Center(
                                    child: Container(
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: GeneralColors.primaryColor,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: Get.width,
          height: 46,
          child: Row(
            children: [
              //button for Rest Filter
              Container(
                margin: const EdgeInsets.only(left: Dimens.paddingBody),
                width: Get.width / 2.3,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    startPricingRange.value = 2.0.toDouble();
                    endPricingRange.value = 20.0.toDouble();
                    selectedIndexReview.value = 0;
                    toastification.show(
                      context: context,
                      type: ToastificationType.success,
                      style: ToastificationStyle.fillColored,
                      title: 'Successful purchase',
                      description: '''Your purchase was successful!
Thank you for choosing us''',
                      
                      showProgressBar: false,
                      alignment: Alignment.topCenter,
                      autoCloseDuration: const Duration(seconds: 4),
                      borderRadius: BorderRadius.circular(12.0),
                      backgroundColor: GeneralColors.primaryColor,
                      closeOnClick: false,
                      dragToClose: true,
                    );
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    elevation: MaterialStatePropertyAll(0.0),
                  ),
                  child: Text(
                    'Rest Filter',
                    style: GeneralTextStyle.textButton.copyWith(
                        color: GeneralColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 19),
                  ),
                ),
              ),
              //button for apply filter and navigate to Home Screen
              Container(
                margin: const EdgeInsets.only(left: Dimens.paddingBody),
                width: Get.width / 2.4,
                decoration: const BoxDecoration(
                  color: GeneralColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    elevation: MaterialStatePropertyAll(0.0),
                  ),
                  child: Text(
                    'Apply',
                    style: GeneralTextStyle.textButton
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
