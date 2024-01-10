import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_widget/flutter_expandable_widget.dart';
import 'package:get/get.dart';

import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/profile_style.dart';


class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
    required this.iconFaqList,
    required this.titleFaqList,
  });

  final List<IconData> iconFaqList;
  final List<String> titleFaqList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: iconFaqList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Divider(
                  color: Colors.blueGrey[100],
                ),
                ExpandableWidget(
                  trailing: const Icon(
                    Icons.expand_more,
                    color: GeneralColors.primaryColor,
                    size: 26,
                  ),
                  trailingEndTurns: 0.5,
                  trailingDuration:
                      const Duration(milliseconds: 200),
                  title: Row(
                    children: [
                      //Icon
                      Icon(
                        iconFaqList[index],
                        color: GeneralColors.primaryColor,
                        size: 35,
                      ),
                      (Get.width / 20).width,
                      //title
                      Text(
                        titleFaqList[index],
                        style: ProfileStyle.titleFAQ,
                      ),
                    ],
                  ),
                  children: [
                    Divider(
                      color: Colors.blueGrey[100],
                    ),
                    10.0.height,
                    Row(
                      children: [
                        30.0.width,
                        const Icon(
                          Icons.circle,
                          color: GeneralColors.primaryColor,
                          size: 12,
                        ),
                        (Get.width / 30).width,
                        Text(
                          '(480) 555-0103',
                          style: ProfileStyle.bodyFAQ
                              .copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
  }
}