import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/methods/home_screen.dart';
import 'package:clothing_shop/view/widgets/start_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/dimens.dart';
import '../../constant/lists.dart';
import '../../model/products_model.dart';
import '../../theme/colors/general_colors.dart';
import '../../theme/textStyle/home_style.dart';
import '../screens/single_product.dart';

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
                                HomeMethod().isFavorite(selectProduct.value);
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
