import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../model/chat_model.dart';
import '../../../theme/textStyle/chat_style.dart';

class OppositeUserMessage extends StatelessWidget {
  OppositeUserMessage({
    super.key,
    required this.boxShadow,
    required this.index,
  });

  BoxShadow boxShadow;
  RxInt index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 70, top: 6),
      decoration: BoxDecoration(
        boxShadow: [boxShadow],
      ),
      child: Column(
        children: [
          //Box Text Message
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                messages[index.value].textMessage,
                style: ChatTextStyle.oppositeUserMessage,
              ),
            ),
          ),
          8.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Profile image
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.explore21.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //Time Send Message
              Text(
                '${messages[index.value].time} pm',
                style: ChatTextStyle.timeSendMessage,
              ),
            ],
          ),
          10.0.height
        ],
      ),
    );
  }
}
