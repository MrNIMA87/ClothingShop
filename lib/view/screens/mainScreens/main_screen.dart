import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/view/screens/mainScreens/favorite_screen.dart';
import 'package:clothing_shop/view/screens/mainScreens/home_screen.dart';
import 'package:clothing_shop/view/screens/others/messenger.dart';
import 'package:clothing_shop/view/screens/others/my_cart.dart';
import 'package:clothing_shop/view/screens/mainScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/general/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //
  List<Widget> screens = [
    HomeScreen(),
    const MyCart(),
    FavoriteScreen(),
    const Messenger(),
    ProfileScreen(),
  ].obs;

  //
  RxList routeHistory = [].obs;

  RxInt selectedBtmNavBarIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      const MyCart(),
      FavoriteScreen(),
      const Messenger(),
      ProfileScreen(),
    ].obs;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          routeHistory.removeLast();
          return selectedBtmNavBarIndex.value = routeHistory.last;
        },
        child: Scaffold(
          backgroundColor: GeneralColors.bgColor,
          //for show pages
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(
              () => IndexedStack(
                index: selectedBtmNavBarIndex.value,
                children: [
                  HomeScreen(),
                  const MyCart(),
                  FavoriteScreen(),
                  const Messenger(),
                  ProfileScreen(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
              selectedBtmNavBarIndex: selectedBtmNavBarIndex,
              routeHistory: routeHistory),
        ),
      ),
    );
  }
}
//  Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 width: Get.width / 7.5,
//                 height: Get.height / 5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.home,
//                   color: GeneralColors.primaryColor,
//                   size: 25,
//                 ),
//               ),
//               Container(
//                 width: Get.width / 7.5,
//                 height: Get.height / 5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.home,
//                   color: GeneralColors.primaryColor,
//                   size: 25,
//                 ),
//               ),
//               Container(
//                 width: Get.width / 7.5,
//                 height: Get.height / 5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.home,
//                   color: GeneralColors.primaryColor,
//                   size: 25,
//                 ),
//               ),
//               Container(
//                 width: Get.width / 7.5,
//                 height: Get.height / 5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.home,
//                   color: GeneralColors.primaryColor,
//                   size: 25,
//                 ),
//               ),
//               Container(
//                 width: Get.width / 7.5,
//                 height: Get.height / 5,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ],
//           ),