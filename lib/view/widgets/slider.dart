import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../theme/colors/general_colors.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> fakeBanner = [
      Image.asset(Assets.images.bannerSlider2.path),
      Image.asset(Assets.images.bannerSlider3.path),
      Image.asset(Assets.images.bannerSlider3.path),
      Image.asset(Assets.images.bannerSlider2.path),
      Image.asset(Assets.images.bannerSlider3.path),
    ];
    RxInt _current = 0.obs;
    return Column(
      children: [
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
                                  ? GeneralColors.primaryColor
                                  : Colors.grey[300]),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
