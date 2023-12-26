import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/dimens.dart';
import '../../../theme/colors/general_colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({
    super.key,
    required this.selectedBtmNavBarIndex,
    required this.routeHistory,
  });

  RxInt selectedBtmNavBarIndex = 0.obs;
  RxList routeHistory = [].obs;
  //
  List<IconData> iconsBtmNavBarNotSelected = [
    Icons.home,
    Icons.shopping_bag_outlined,
    CupertinoIcons.heart,
    CupertinoIcons.chat_bubble_text,
    CupertinoIcons.profile_circled,
  ];
  //
  List<IconData> iconsBtmNavBarSelected = [
    Icons.home,
    Icons.shopping_bag,
    CupertinoIcons.heart_fill,
    CupertinoIcons.chat_bubble_text_fill,
    CupertinoIcons.profile_circled,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Dimens.paddingBody, right: Dimens.paddingBody),
      width: double.maxFinite,
      height: Get.height / 12.5,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 31, 32, 41),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: SizedBox(
        width: double.maxFinite,
        height: Get.height / 12,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectedBtmNavBarIndex.value = index;
                  routeHistory.add(index);
                },
                //TODO: Inja bayad yek animation bezari ke vaghti box sefid taghir kard ba animation bere roye index badi
                child: Obx(
                  () => Container(
                    margin:
                        const EdgeInsets.only(left: Dimens.bodyMargin / 1.5),
                    width: Get.width / 7.5,
                    height: Get.height / 5,
                    decoration: BoxDecoration(
                      color: selectedBtmNavBarIndex == index
                          ? Colors.white
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      selectedBtmNavBarIndex == index
                          ? iconsBtmNavBarSelected[index]
                          : iconsBtmNavBarNotSelected[index],
                      color: selectedBtmNavBarIndex == index
                          ? GeneralColors.primaryColor
                          : Colors.grey,
                      size: 27,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
