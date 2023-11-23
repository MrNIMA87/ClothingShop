import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/general_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> fakeBanner = [
      Image.asset(Assets.images.bannerSlider2.path),
      Image.asset(Assets.images.bannerSlider3.path),
    ];
    RxInt _current = 0.obs;
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
          body: Padding(
            padding: const EdgeInsets.all(Dimens.bodyMargin / 2),
            child: Column(children: [
              CarouselSlider(
                items: fakeBanner,
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    _current.value = index.toInt();
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: fakeBanner
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Obx(
                              () => Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == e.key
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
