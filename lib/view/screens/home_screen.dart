import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/constant/lists.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/methods/home_screen.dart';
import 'package:clothing_shop/model/products_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/screens/single_product.dart';
import 'package:clothing_shop/view/widgets/category.dart';
import 'package:clothing_shop/view/widgets/sgin/flash_sale_category.dart';
import 'package:clothing_shop/view/widgets/slider.dart';
import 'package:clothing_shop/view/widgets/start_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:get/get.dart';

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

  RxInt selectedFlashSaleCateGor = 0.obs;

  RxBool selectFavorite = false.obs;

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
                  FlashSaleCategory(),
                  (Dimens.bodyMargin / 3).height,
                  //Items Flash Sale
                  Items(),
                ],
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
            width: 300,
            height: Get.height / 14,
            decoration: BoxDecoration(
              border: Border.all(
                color: GeneralColors.borderInput,
              ),
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32)),
            ),
            child: const Center(
              child: SizedBox(
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

class Items extends StatelessWidget {
  Items({
    super.key,
  });

  RxInt selectProduct = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          childAspectRatio: Get.width / (Get.height / 1.3),
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectProduct.value = index;
              print(selectProduct);
              Get.to(() => SingleProduct(
                    selectedProductIndex: selectProduct,
                  ));
            },
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.bodyMargin),
                    ),
                    child: Column(
                      children: [
                        //image
                        Container(
                          width: double.maxFinite,
                          height: Get.height / 4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                productList[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                HomeMethod().isFavorite(index.obs);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Icon(
                                      ConstantLists.favoriteList.contains(index)
                                          ? CupertinoIcons.heart_fill
                                          : CupertinoIcons.heart,
                                      size: 20,
                                      color: GeneralColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.0.height,
                  //Title and race
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //title
                      Text(
                        productList[index].title,
                        style: HomeStyle.titleProduct,
                      ),
                      //Race

                      MyStarIcon(selectedIndex: index.obs),
                      5.0.width,
                    ],
                  ),
                  9.0.height,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '\$${productList[index].price}',
                      style: HomeStyle.titleProduct,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}