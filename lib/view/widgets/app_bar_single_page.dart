import 'package:clothing_shop/view/widgets/icon_back_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

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
      leading: BackPage(width: 40.0.obs,),
      title:  Text(
        title,
        style: HomeStyle.titleSingleProduct.copyWith(color: Colors.black87),
      ),
    );
  }
}
