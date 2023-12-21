import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/profile_style.dart';

class ChoiceProfileScreen extends StatelessWidget {
  ChoiceProfileScreen(
      {super.key, required this.iconList, required this.titleList});
//TODO: Icon haro avaz kon va bejash image bezar noskhe ayandam. Yadet Nare To bayad Behtarin Beshi (:
  List<IconData> iconList = [];
  //titles
  List<String> titleList = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Icon and title
                Row(
                  children: [
                    Icon(
                      iconList[index],
                      color: GeneralColors.primaryColor,
                      size: 30,
                    ),
                    5.0.width,
                    Text(
                      titleList[index],
                      style: ProfileStyle.titleList,
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: GeneralColors.primaryColor,
                  size: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
