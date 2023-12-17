import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/model/my_cart_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/theme/textStyle/single_product_style.dart';
import 'package:clothing_shop/view/screens/mainScreens/home_screen.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:clothing_shop/view/widgets/general/button_sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/textStyle/general_style.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ButtonSign(
              title: 'Proceed to Checkout',
              onPressed: () {
                Get.bottomSheet(
                  backgroundColor: Colors.white,
                  barrierColor: const Color.fromARGB(19, 0, 0, 0),
                  Container(
                    padding: const EdgeInsets.all(Dimens.paddingBody),
                    width: double.infinity,
                    height: Get.height / 2.5,
                    decoration: const BoxDecoration(
                      color: GeneralColors.bgColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      children: [
                        const ApplyPromoCode(),
                        Dimens.paddingBody.height,
                        const ShowPrice(),
                        20.0.height,
                        ButtonSign(
                          title: 'Proceed to Checkout',
                          onPressed: () {
                            return Get.dialog(
                              const SuccessFul(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class SuccessFul extends StatelessWidget {
  const SuccessFul({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          colorFilter: const ColorFilter.mode(
                            GeneralColors.primaryColor,
                            BlendMode.color,
                          ),
                          image: AssetImage(
                            Assets.icons.success.path,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    10.0.height,
                    //title
                    Text(
                      "SuccessFul",
                      style: GeneralTextStyle.title.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    //Buttons
                    10.0.height,
                    Container(
                      width: 200,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        color: GeneralColors.primaryColor,
                      ),
                      child: ButtonSign(
                          title: 'OK',
                          onPressed: () {
                            Get.offAll(() => HomeScreen());
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShowPrice extends StatelessWidget {
  const ShowPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Prices(price: 407.94, title: 'Sub-Total'),
        Prices(price: 25.00, title: 'Delivery Fee'),
        Prices(price: -35.00, title: 'Discount'),
        10.0.height,
        Prices(price: 397.94, title: 'Total Cost'),
      ],
    );
  }
}

class Prices extends StatelessWidget {
  Prices({
    super.key,
    required this.title,
    required this.price,
  });
  String title = 'Sub-Total';
  double price = 407.94;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GeneralTextStyle.hint.copyWith(fontSize: 14),
          ),
          Text(
            '\$ ${price.toString()}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ApplyPromoCode extends StatelessWidget {
  const ApplyPromoCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15),
          width: Get.width / 1.5,
          height: Get.height / 16,
          decoration: BoxDecoration(
            border: Border.all(
              color: GeneralColors.borderInput,
            ),
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(32)),
          ),
          child: const SizedBox(
            // width: Get.width / 1.4,
            child: TextField(
              autocorrect: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'Promo Code',
                hintStyle: GeneralTextStyle.hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          width: 80,
          height: Get.height / 20,
          decoration: const BoxDecoration(
            color: GeneralColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(1000)),
          ),
          child: Center(
            child: Text(
              'Apply',
              style: GeneralTextStyle.textButton.copyWith(fontSize: 18),
            ),
          ),
        ),
      ],
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
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
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
                                myCartProducts[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              myCartProducts[index].numberProduct!.value -= 1;
                              if (myCartProducts[index].numberProduct!.value <=
                                  1) {
                                myCartProducts[index].numberProduct!.value = 1;
                              }
                              print(numberProduct);
                            },
                            style: const ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              elevation: MaterialStatePropertyAll(0.0),
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
                              myCartProducts[index].numberProduct!.value += 1;

                              print(myCartProducts[index].numberProduct);
                            },
                            style: const ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero),
                              elevation: MaterialStatePropertyAll(0.0),
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
