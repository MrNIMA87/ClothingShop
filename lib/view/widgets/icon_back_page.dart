import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackPage extends StatelessWidget {
  BackPage({
    super.key,
    required this.width,
  });
  RxDouble width = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black87,
          size: 25,
        ),
      ),
    );
  }
}
