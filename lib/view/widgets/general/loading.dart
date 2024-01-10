import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      color: GeneralColors.primaryColor,
      size: 50,
    );
  }
}
