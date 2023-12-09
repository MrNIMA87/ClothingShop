import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/products_model.dart';
import '../../theme/textStyle/general_style.dart';

class MyStarIcon extends StatelessWidget {
  MyStarIcon({
    super.key,
    required this.selectedIndex,
  });
  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: const ShapeDecoration(
            shape: StarBorder(
              side: BorderSide(
                color: Colors.orange,
                width: 4,
              ),
            ),
          ),
        ),
        8.0.width,
        Text(
          productList[selectedIndex.value].race,
          style: GeneralTextStyle.hint.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
