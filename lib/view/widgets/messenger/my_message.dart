import 'package:clothing_shop/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/chat_model.dart';
import '../../../theme/colors/general_colors.dart';
import '../../../theme/textStyle/chat_style.dart';

class MyMessage extends StatelessWidget {
  MyMessage({
    super.key,
    required this.boxShadow,
    required this.index,
  });
  BoxShadow boxShadow;
  RxInt index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 75, top: 6),
      decoration: BoxDecoration(
        boxShadow: [boxShadow],
      ),
      child: Column(
        children: [
          //Box Text Message
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: GeneralColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Text(
                messages[index.value].textMessage,
                style: ChatTextStyle.myMessage,
              ),
            ),
          ),
          8.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Time Send Message
              
              Text(
                '${messages[index.value].time} pm',
                style: ChatTextStyle.timeSendMessage,
              ),

              //Name and image Profile user

              //Profile image
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(messages[index.value].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
