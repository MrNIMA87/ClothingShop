import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/view/screens/mainScreens/single_product.dart';
import 'package:clothing_shop/view/widgets/sgin/flash_sale_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/lists.dart';
import '../../../model/products_model.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/home_style.dart';
import '../../widgets/app_bar_single_page.dart';
import '../../widgets/general/loading.dart';
import '../../widgets/notifications/eror_notification.dart';
import '../../widgets/start_icon.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  RxInt selectFavoriteProduct = 0.obs;
  RxList favoriteProduct = ConstantLists.favoriteList;
  RxList<String> titleCategory = [
    'All',
    'Newest',
    'Popular',
    'Man',
    'Woman',
  ].obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBarSinglePage(title: 'My Wishlist'),
        ),
        body: FutureBuilder(
          // Simulate a 2-second delay
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading(); // Show loading widget
            } else {
              return OriginalWidgetFavoriteScreen(
                  titleCategory: titleCategory,
                  favoriteProduct: favoriteProduct,
                  selectFavoriteProduct:
                      selectFavoriteProduct); // Show actual content
            }
          },
        ),
      ),
    );
  }
}

class OriginalWidgetFavoriteScreen extends StatelessWidget {
  const OriginalWidgetFavoriteScreen({
    super.key,
    required this.titleCategory,
    required this.favoriteProduct,
    required this.selectFavoriteProduct,
  });

  final RxList<String> titleCategory;
  final RxList favoriteProduct;
  final RxInt selectFavoriteProduct;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.bodyMargin),
        child: Column(
          children: [
            FlashSaleCategory(titleCategory: titleCategory),
            Dimens.paddingBody.height,
            SizedBox(
              child: Obx(
                () => favoriteProduct.isEmpty ? Container(
                  margin: EdgeInsets.only(top: 60),
                  width: Get.width ,
                  height: Get.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.icons.noData.path), fit: BoxFit.cover),
                  ),
                ) :GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      childAspectRatio: Get.width / (Get.height / 1.3),
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: favoriteProduct.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectFavoriteProduct.value = index;
                          print(selectFavoriteProduct);
                          Get.to(
                            () => SingleProduct(
                              selectedProductIndex: 0.obs,
                            ),
                          );
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.bodyMargin),
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
                                            productList[favoriteProduct[index]]
                                                .image,
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
                                            ConstantLists.favoriteList
                                                .remove(index);
                                            sendErrorNotification(
                                                context,
                                                'Favorite',
                                                'This Product Remove You\'re Favorite');
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                CupertinoIcons.heart_fill,
                                                size: 20,
                                                color:
                                                    GeneralColors.primaryColor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //title
                                  Text(
                                    productList[favoriteProduct[index]].title,
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
                                  '\$${productList[favoriteProduct[index]].price}',
                                  style: HomeStyle.titleProduct,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
