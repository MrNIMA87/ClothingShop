import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../model/chat_model.dart';
import '../../../theme/textStyle/chat_style.dart';
import '../icon_back_page.dart';

messengerAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackPage(width: 40.0.obs),
            8.0.width,
            Container(
              margin: const EdgeInsets.all(5),
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  //TODO: inja bayad data ro az user begiri na az list(Socket)
                  image: AssetImage(Assets.images.explore21.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Angine Brekke',
                  style: ChatTextStyle.titleName,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 65, top: 5.0),
                  child: Text(
                    'Online',
                    style: ChatTextStyle.statusUser,
                  ),
                ),
              ],
            ),
          ],
        ),
        //Icon for show more options
        Container(
          width: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.9),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black87,
              size: 26,
            ),
          ),
        ),
      ],
    ),
  );
}
