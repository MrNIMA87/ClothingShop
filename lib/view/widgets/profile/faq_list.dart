import 'package:clothing_shop/constant/extension.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/textStyle/profile_style.dart';
import '../sgin/flash_sale_category.dart';

class FAQList extends StatelessWidget {
  FAQList({super.key});
  List<String> titleCategory = [
    'All',
    'Services',
    'General',
    'Account',
    'Log Out',
  ];
  List<String> titleFAQ = [
    'Is there a return policy',
    'Can I save my favorite items for later?',
    'Can I share products with my friends?',
    'How do I contact customer support?',
    'What payment methods are accepted?',
    'How to add review?',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Category

          FlashSaleCategory(titleCategory: titleCategory.obs),
          10.0.height,
          Divider(
            color: Colors.blueGrey[100],
          ),
          //FAQS
          Expanded(
              child: ListView.builder(
            itemCount: titleFAQ.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    
                    ExpandablePanel(
                      header: Text(
                        titleFAQ[index],
                        style: ProfileStyle.titleFAQ,
                      ),
                      collapsed: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: ProfileStyle.bodyFAQ,
                      ),
                      expanded: Divider(
                        color: Colors.blueGrey[100],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
