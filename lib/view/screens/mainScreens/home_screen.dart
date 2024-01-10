import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';

import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/screens/others/filter_screen.dart';
import 'package:clothing_shop/view/widgets/category.dart';
import 'package:clothing_shop/view/widgets/general/loading.dart';
import 'package:clothing_shop/view/widgets/sgin/flash_sale_category.dart';
import 'package:clothing_shop/view/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // ProductController productsController = Get.put(ProductController());
  List<String> flashSaleCategoryTitle = [
    'All',
    'Newest',
    'Popular',
    'Man',
    'Woman',
  ];
  RxList<String> titleCategory = [
    'All',
    'Newest',
    'Popular',
    'Man',
    'Woman',
  ].obs;
  RxInt selectedFlashSaleCateGor = 0.obs;
  RxBool alignment = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //appBar
        appBar: appBar(),
        backgroundColor: GeneralColors.bgColor,
        body: FutureBuilder(
          // Simulate a 2-second delay
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading(); // Show loading widget
            } else {
              return OriginalWidgetHomeScreen(
                  titleCategory: titleCategory); // Show actual content
            }
          },
        ),
      ),
    );
  }

//AppBar Widget
  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(Get.height / 15.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //text field for search
          Container(
            width: Get.width / 1.29,
            height: Get.height / 16,
            decoration: BoxDecoration(
              border: Border.all(
                color: GeneralColors.borderInput,
              ),
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
            child: InkWell(
              onTap: () {},
              child: const SizedBox(
                // width: Get.width / 1.4,
                child: TextField(
                  autocorrect: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GeneralTextStyle.hint,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    prefixIconColor: GeneralColors.primaryColor,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          //Filter
          InkWell(
            onTap: () {
              Get.to(() => const FilterScreen(),
                  transition: Transition.upToDown,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 900));
            },
            child: Container(
              width: Get.width / 7.6,
              decoration: const BoxDecoration(
                color: GeneralColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.filter_list, size: Get.height / 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OriginalWidgetHomeScreen extends StatelessWidget {
  const OriginalWidgetHomeScreen({
    super.key,
    required this.titleCategory,
  });

  final RxList<String> titleCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimens.bodyMargin,
            right: Dimens.bodyMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //slider
              const SliderWidget(),
              //
              Dimens.bodyMargin.height,
              //category:
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: HomeStyle.title,
                  ),
                  Text(
                    'See All',
                    style: HomeStyle.seeAll,
                  ),
                ],
              ),
              Dimens.bodyMargin.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Category(
                    icon: Assets.icons.tShirt.provider(),
                    title: 'T-Shirt',
                  ),
                  Category(
                    icon: Assets.icons.pant.provider(),
                    title: 'Pant',
                  ),
                  Category(
                    icon: Assets.icons.dress.provider(),
                    title: 'Dress',
                  ),
                  Category(
                    icon: Assets.icons.jacket.provider(),
                    title: 'Jacket',
                  ),
                ],
              ),
              Dimens.bodyMargin.height,
              //titleCategory flash sale
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Flash sale',
                  style: HomeStyle.title,
                ),
              ),
              (Dimens.bodyMargin / 3).height,
              FlashSaleCategory(titleCategory: titleCategory),
              (Dimens.bodyMargin / 3).height,
              //Items Flash Sale
              Items(),
            ],
          ),
        ),
      ),
    );
  }
}
