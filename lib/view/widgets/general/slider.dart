import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 3),
      child: const SpinKitCircle(
        color: GeneralColors.primaryColor,
        size: 50,
      ),
    );
  }
}
