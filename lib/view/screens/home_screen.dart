import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/controller/product_controller.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/widgets/category.dart';
import 'package:clothing_shop/view/widgets/general/slider.dart';
import 'package:clothing_shop/view/widgets/product_list.dart';
import 'package:clothing_shop/view/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productsController = Get.put(ProductController());

  List<String> flashSaleCategoryTitle = [
    'All',
    'Newest',
    'Popular',
    'Man',
    'Woman',
  ];

  RxInt selectedFlashSaleCateGory = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          //appBar
          appBar: appBar(),
          backgroundColor: GeneralColors.bgColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.bodyMargin),
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
                  Obx(
                    () => productsController.loading == false
                        ? SizedBox(
                            width: double.infinity,
                            height: double.maxFinite,
                            child: ListView.builder(
                              itemCount: flashSaleCategoryTitle.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedFlashSaleCateGory.value = index;
                                    print(selectedFlashSaleCateGory);
                                  },
                                  child: Obx(
                                    () => ProductList(index: index),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Loading(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //text field for search
          Container(
            width: 300,
            height: Get.height / 14,
            decoration: BoxDecoration(
              border: Border.all(
                color: GeneralColors.borderInput,
              ),
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
            child: Center(
              child: SizedBox(
                // width: Get.width / 1.4,
                child: const TextField(
                  autocorrect: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GeneralTextStyle.hint,
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: GeneralColors.primaryColor,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          //Filter
          Container(
            width: Get.width / 7,
            height: Get.height / 14,
            decoration: BoxDecoration(
              color: GeneralColors.primaryColor,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: const Center(
              child: Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }
}
