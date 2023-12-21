import 'package:clothing_shop/view/widgets/messenger/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../model/chat_model.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/general_style.dart';

class MessengerTextField extends StatelessWidget {
  const MessengerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController valueController = TextEditingController();
    return Container(
      width: double.maxFinite,
      height: Get.height / 14,
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.09),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          //Icon show more options
          IconsTextField(
            color: Colors.white70,
            iconColor: Colors.black87,
            icon: Icons.add,
          ),
          //Text field
          Expanded(
            child: TextField(
              autocorrect: true,
              controller: valueController,
              keyboardType: TextInputType.text,
              scrollPhysics: const ClampingScrollPhysics(),
              onSubmitted: (value) {
                messages.add(ChatModel(
                  textMessage: value,
                  time: '${DateTime.now().hour}:${DateTime.now().minute}',
                  oppositeUser: false,
                ));
                FocusManager.instance.primaryFocus?.unfocus();
                //
                valueController.clear();
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type a message here...',
                hintStyle: GeneralTextStyle.hint,
              ),
            ),
          ),
          //Icon for record voice
          IconsTextField(
            color: GeneralColors.primaryColor,
            iconColor: Colors.white,
            icon: Icons.mic,
          ),
        ],
      ),
    );
  }
}
