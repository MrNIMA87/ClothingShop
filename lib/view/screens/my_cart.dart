import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/model/my_cart_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/theme/textStyle/single_product_style.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  RxInt numberProduct = 1.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarSinglePage(title: 'My Cart'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.bodyMargin),
            child: Column(
              children: [
                ListItems(numberProduct: numberProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.numberProduct,
  });

  final RxInt numberProduct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: myCartProducts.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              padding:
                  const EdgeInsets.only(right: 15.0, left: 15.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //icon no trash for cancel event
                  Icon(
                    CupertinoIcons.trash_slash_fill,
                    color: Colors.red,
                    size: 35,
                  ),
                  //Icon trash for remove item
                  Icon(
                    CupertinoIcons.trash_fill,
                    color: Colors.red,
                    size: 35,
                  ),
                ],
              ),
            ),
            onDismissed: (direction) {
              myCartProducts.removeAt(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: (Dimens.paddingBody + 10),
              ),
              child: SizedBox(
                width: double.infinity,
                height: Get.height / 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //image
                    Row(
                      children: [
                        Container(
                          width: Get.width / 4.4,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  myCartProducts[index].image,),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        //Title Product
                        Text(
                          myCartProducts[index].title,
                          style: HomeStyle.titleProduct,
                        ),
                        //Size Product
                        Text(
                          'Size: ${myCartProducts[index].size}',
                          style: SingleProductStyle.info,
                        ),
                        //Price Product
                        Text(
                          myCartProducts[index].price,
                          style: HomeStyle.titleProduct,
                        ),
                      ],
                    ),
                    //
                    Row(
                      children: [
                        //Icon For Remove Product on Page Buy Product
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              myCartProducts[index]
                                  .numberProduct!
                                  .value -= 1;
                              if (myCartProducts[index]
                                      .numberProduct!
                                      .value <=
                                  1) {
                                myCartProducts[index]
                                    .numberProduct!
                                    .value = 1;
                              }
                              print(numberProduct);
                            },
                            style: const ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor:
                                  MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.zero),
                              elevation:
                                  MaterialStatePropertyAll(0.0),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.minimize,
                                color: Colors.black87,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${myCartProducts[index].numberProduct}',
                          ),
                        ),

                        //Icon For Add Product on Page Buy Product
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            color: GeneralColors.primaryColor,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              myCartProducts[index]
                                  .numberProduct!
                                  .value += 1;

                              print(myCartProducts[index]
                                  .numberProduct);
                            },
                            style: const ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor:
                                  MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.zero),
                              elevation:
                                  MaterialStatePropertyAll(0.0),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
