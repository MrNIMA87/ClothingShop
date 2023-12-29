import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';

import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/screens/others/filter_screen.dart';
import 'package:clothing_shop/view/widgets/category.dart';
import 'package:clothing_shop/view/widgets/sgin/flash_sale_category.dart';
import 'package:clothing_shop/view/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      setState(() {
        alignment.value = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnimatedOpacity(
        opacity: alignment.value ? 1 : 0.1,
        duration: const Duration(seconds: 2),
        child: Scaffold(
          //appBar
          appBar: appBar(),
          backgroundColor: GeneralColors.bgColor,
          body: AnimatedContainer(
            width: alignment.value ? Get.width : 1,
            height: alignment.value ? Get.height : 1,
            duration: Duration(seconds: 2),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                      FlashSaleCategory(titleCategory: titleCategory),
                      (Dimens.bodyMargin / 3).height,
                      //Items Flash Sale
                      Items(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//AppBar Widget
  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //text field for search
          Container(
            width: Get.width / 1.29,
            height: Get.height / 14,
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
                    prefixIcon: Icon(Icons.search),
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
          ),
        ],
      ),
    );
  }
}
