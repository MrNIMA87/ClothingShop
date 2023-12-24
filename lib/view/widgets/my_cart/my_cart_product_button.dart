import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartProductButton extends StatelessWidget {
  MyCartProductButton({
    super.key,
    this.iconColor = Colors.black87,
    this.backgroundColor = Colors.black87,
    this.icon = Icons.minimize,
    this.alignment = Alignment.topCenter,
    required this.isRemoveButton,
  });
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
  final Alignment alignment;
  RxBool isRemoveButton = false.obs;
  RxInt numberProduct = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: backgroundColor,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (isRemoveButton.value) {
            numberProduct.value +=1;
            print(numberProduct.value);
          } else {
            numberProduct.value -= 1;
            print(numberProduct.value);
          }
        },
        style: const ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStatePropertyAll(
            Colors.transparent,
          ),
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          elevation: MaterialStatePropertyAll(0.0),
        ),
        child: Align(
          alignment: alignment,
          child: Icon(
            icon,
            color: iconColor,
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
