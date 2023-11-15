import 'package:clothing_shop/theme/colors/my_colors.dart';
import 'package:clothing_shop/view/widgets/appBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.bgColor,
        appBar: appBar(),
      ),
    );
  }
}
