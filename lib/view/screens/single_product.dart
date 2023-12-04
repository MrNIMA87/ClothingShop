import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/model/products_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/theme/textStyle/single_product_style.dart';
import 'package:clothing_shop/view/widgets/divider.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:clothing_shop/view/widgets/single_product_category.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../widgets/select_color.dart';
import '../widgets/start_icon.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({super.key});

  RxInt selectedIndex = 0.obs;
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
                      image: AssetImage(productList[selectedIndex.value].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //TODO: hatman aks haro avaz kon
                            //Button for back page
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black87,
                                  size: 26,
                                ),
                              ),
                            ),
                            //TODO: Fek konam niaz be edit style bashe
                            const Text(
                              'Product Details',
                              style: HomeStyle.titleSingleProduct,
                            ),
                            //Icon for list favorites
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 26,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                    onTap: () => selectedIndex.value = index,
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
                          selectedIndex: selectedIndex,
                        ),
                      ],
                    ),
                    Dimens.bodyMargin.height,
                    //title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        productList[selectedIndex.value].title,
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
                        productList[selectedIndex.value].description,
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
                          selectedIndexColor: selectedIndexColor),
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
                                  '\$${productList[selectedIndex.value].price}',
                                  style: SingleProductStyle.titleInfo.copyWith(
                                      fontWeight: FontWeight.w600, height: 1.3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const buyButton(),
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

class buyButton extends StatelessWidget {
  const buyButton({
    super.key,
  });

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
        onPressed: () {},
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
