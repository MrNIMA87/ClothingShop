import 'package:clothing_shop/constant/dimens.dart';
import 'package:clothing_shop/constant/extension.dart';
import 'package:clothing_shop/model/chat_model.dart';
import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:clothing_shop/theme/textStyle/chat_style.dart';
import 'package:clothing_shop/view/widgets/messenger/my_message.dart';
import 'package:clothing_shop/view/widgets/messenger/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/messenger/app_bar.dart';
import '../../widgets/messenger/opposite_user_message.dart';

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {

    BoxShadow boxShadow = BoxShadow(
      color: Colors.blueGrey.withOpacity(0.10),
      spreadRadius: 20,
      blurRadius: 50,
      offset: const Offset(0, 0),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: GeneralColors.primaryColor,
        appBar: messengerAppBar(),
        body: Container(
          width: Get.width,
          height: Get.height / 1.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.bodyMargin),
            child: Column(
              children: [
                //Title chat
                const Text(
                  'TODAY',
                  style: ChatTextStyle.dateChat,
                ),
                Dimens.paddingBody.height,
                //Chats
                Obx(
                  () => Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        //Box Message
                        return messages[index].oppositeUser == true
                            ? OppositeUserMessage(
                                boxShadow: boxShadow, index: index.obs)
                            : MyMessage(boxShadow: boxShadow, index: index.obs);
                      },
                    ),
                  ),
                ),
                //input
               const MessengerTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
