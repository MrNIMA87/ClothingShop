import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/controller/product_controller.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:clothing_shop/theme/textStyle/home_style.dart';
import 'package:clothing_shop/view/widgets/category.dart';
import 'package:clothing_shop/view/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ProductController productsController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          //appBar
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //text field for search
                Container(
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
                      width: Get.width / 1.4,
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
          ),
          backgroundColor: GeneralColors.bgColor,
          body: Obx(() => productsController.loading == true
              ? Padding(
                  padding: const EdgeInsets.all(Dimens.paddingBody),
                  child: Column(
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                height: 45,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(31)),
                                ),
                                child: Text(
                                    productsController.products[index].title!),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
