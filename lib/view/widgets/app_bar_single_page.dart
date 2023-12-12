import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/textStyle/home_style.dart';

class AppBarSinglePage extends StatelessWidget {
  AppBarSinglePage({
    super.key,
    required this.title,
  });
 String title = 'My Wishlist';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 10.0),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(100, 167, 166, 166),
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 26,
          ),
        ),
      ),
      title:  Text(
        title,
        style: HomeStyle.titleSingleProduct.copyWith(color: Colors.black87),
      ),
    );
  }
}
