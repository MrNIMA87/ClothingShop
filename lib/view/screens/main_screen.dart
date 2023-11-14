import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        body: Text('data'),
      ),
    );
  }
}