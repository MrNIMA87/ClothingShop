import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/theme/textStyle/profile_style.dart';
import 'package:clothing_shop/view/widgets/app_bar_single_page.dart';
import 'package:clothing_shop/view/widgets/profile/faq_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/colors/general_colors.dart';
import '../../../../theme/textStyle/general_style.dart';

import '../../../widgets/profile/contact_list.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});
  //Seriously, I couldn't think of another name
  List<String> topCategory = [
    'FAQ',
    'Contact Us',
  ];
  //TODO: Icon haye inaro avaz kon va bejash image bezar (:
  List<IconData> iconFaqList = [
    Icons.headset_mic,
    Icons.telegram,
    Icons.facebook,
    Icons.phone,
    Icons.email
  ];
  List<String> titleFaqList = [
    'Customer Service',
    'Telegram',
    'Facebook',
    'Phone',
    'Email',
  ];
  //

  //
  RxInt selectedTopCategory = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarSinglePage(title: 'Help Center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.paddingBody),
        child: Column(
          children: [
            //Search TextField
            const SearchTextFieldHelpCenterScreen(),
            Dimens.bodyMargin.height,
            // top Category
            SizedBox(
              width: double.maxFinite,
              height: Get.height / 15,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedTopCategory.value = index;
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, bottom: Dimens.bodyMargin / 2),
                            height: Get.height / 24,
                            width: Get.width / 2.2,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: selectedTopCategory == index
                                      ? GeneralColors.primaryColor
                                      : Colors.black12,
                                  width: selectedTopCategory == index ? 4 : 2,
                                ),
                              ),
                            ),
                            child: Text(
                              topCategory[index],
                              style: selectedTopCategory == index
                                  ? ProfileStyle.selectedTopCategory
                                  : ProfileStyle.notSelectedTopCategory,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => selectedTopCategory == 0
                  ? FAQList()
                  : ContactList(iconFaqList: iconFaqList, titleFaqList: titleFaqList),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchTextFieldHelpCenterScreen extends StatelessWidget {
  const SearchTextFieldHelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      width: double.maxFinite,
      height: Get.height / 15,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: GeneralColors.borderInput,
        ),
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: TextField(
          controller: searchController,
          keyboardType: TextInputType.text,
          autocorrect: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: GeneralTextStyle.hint,
            prefixIcon: Icon(CupertinoIcons.search),
            prefixIconColor: GeneralColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
