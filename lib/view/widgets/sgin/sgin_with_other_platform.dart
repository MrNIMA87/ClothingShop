import 'package:clothing_shop/theme/textStyle/sgin_in_style.dart';
import 'package:clothing_shop/view/widgets/divider.dart';
import 'package:flutter/material.dart';

class OtherSign extends StatelessWidget {
  OtherSign({super.key, required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          //divider
          Row(
            children: [
              MyDivider(),
              Text(
                title,
                style: SignInStyle.titleSignOtherPlatform,
                textAlign: TextAlign.center,
              ),
              MyDivider()
            ],
          ),
        ],
      ),
    );
  }
}
