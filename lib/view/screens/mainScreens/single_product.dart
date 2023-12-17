import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/methods/home_screen.dart';
import 'package:clothing_shop/model/products_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/theme/textStyle/single_product_style.dart';
import 'package:clothing_shop/view/screens/mainScreens/home_screen.dart';

import 'package:clothing_shop/view/widgets/single_product_category.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../../constant/lists.dart';
import '../../../model/my_cart_model.dart';
import '../../widgets/icon_back_page.dart';
import '../../widgets/select_color.dart';
import '../../widgets/start_icon.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({
    super.key,
    required this.selectedProductIndex,
  });
  RxInt selectedProductIndex;
  RxInt selectedIndexColor = 0.obs;

  List selectColor = [
    const Color.fromARGB(246, 114, 72, 57),
    const Color.fromARGB(255, 177, 119, 98),
    const Color.fromARGB(255, 160, 90, 62),
    Colors.brown,
    const Color.fromARGB(255, 83, 56, 45),
    const Color.fromARGB(255, 32, 23, 19),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GeneralColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Part Top
              Obx(
                () => Container(
                  width: double.maxFinite,
                  height: Get.height / 2.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          productList[selectedProductIndex.value].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 0,
                        left: 0,
                        child: appBar(getProductIndex: selectedProductIndex),
                      ),
                      //List Images
                      Positioned(
                        bottom: 15,
                        right: 20,
                        left: 20,
                        child: Container(
                          width: double.maxFinite,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SizedBox(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    onTap: () =>
                                        selectedProductIndex.value = index,
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            productList[index].image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Dimens.bodyMargin.height,
              Padding(
                padding: const EdgeInsets.all(Dimens.paddingBody),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Female\'s Style',
                          style: GeneralTextStyle.hint,
                          textAlign: TextAlign.start,
                        ),
                        MyStarIcon(
                          selectedIndex: selectedProductIndex,
                        ),
                      ],
                    ),
                    Dimens.bodyMargin.height,
                    //title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        productList[selectedProductIndex.value].title,
                        style: SingleProductStyle.title,
                      ),
                    ),
                    (Dimens.bodyMargin * 2).height,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Product Details',
                        style: SingleProductStyle.titleInfo,
                      ),
                    ),
                    (Dimens.bodyMargin / 2).height,
                    //Description Products
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ExpandableText(
                        productList[selectedProductIndex.value].description,
                        style: SingleProductStyle.info,
                        expandText: 'Read more',
                        collapseText: 'Show less',
                        maxLines: 3,
                        linkColor: GeneralColors.primaryColor,
                      ),
                    ),
                    //
                    (Dimens.bodyMargin / 2).height,
                    Divider(
                      color: Colors.grey[500],
                    ),
                    (Dimens.bodyMargin / 2).height,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Size',
                        style: SingleProductStyle.titleInfo,
                      ),
                    ),
                    //Category for select size
                    SingleProductCategory(),
                    //Select color
                    (Dimens.bodyMargin / 1.5).height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: const TextSpan(
                            text: 'Select Color :',
                            style: SingleProductStyle.titleInfo,
                            children: [
                              TextSpan(
                                text: ' Brown',
                                style: SingleProductStyle.infoColor,
                              )
                            ]),
                      ),
                    ),
                    //category for select color
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SelectedColorCategory(
                        selectColor: selectColor,
                        selectedIndexColor: selectedIndexColor,
                      ),
                    ),
                    //
                    (Dimens.bodyMargin / 2).height,
                    Divider(
                      color: Colors.grey[500],
                    ),
                    (Dimens.bodyMargin / 2).height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total Price',
                                style: SingleProductStyle.info,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Obx(
                                () => Text(
                                  '\$${productList[selectedProductIndex.value].price}',
                                  style: SingleProductStyle.titleInfo.copyWith(
                                      fontWeight: FontWeight.w600, height: 1.3),
                                ),
                              ),
                            ),
                          ],
                        ),
                         buyButton(selectIndex: selectedProductIndex,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class appBar extends StatelessWidget {
  appBar({
    super.key,
    required this.getProductIndex,
  });

  RxInt getProductIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //TODO: hatman aks haro avaz kon
        //Button for back page
             BackPage(width: 50.0.obs),
        //TODO: Fek konam niaz be edit style bashe
        const Text(
          'Product Details',
          style: HomeStyle.titleSingleProduct,
        ),
        //Icon for list favorites
        InkWell(
          onTap: () async {
            await HomeMethod().isFavorite(getProductIndex.value, context);
          
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
                  ConstantLists.favoriteList.contains(getProductIndex.value)
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 20,
                  color: GeneralColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class buyButton extends StatelessWidget {
   buyButton({
    super.key,
    required this.selectIndex,
  });
  RxInt selectIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.8,
      height: Get.height / 17,
      decoration: const BoxDecoration(
        color: GeneralColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.shopping_bag,
          size: 25,
        ),
        onPressed: () {
          myCartProducts.add(MyCartProductModel(
            title: productList[selectIndex.value].title,
            price: productList[selectIndex.value].price,
            size: 'XLL',
          ));
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          elevation: MaterialStatePropertyAll(0.0),
        ),
        label: Text(
          'Add to cart',
          style: GeneralTextStyle.textButton.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
