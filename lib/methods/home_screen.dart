import 'package:clothing_shop/view/widgets/notifications/eror_notification.dart';
import 'package:clothing_shop/view/widgets/notifications/successful_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/lists.dart';

class HomeMethod {
  isFavorite(int index, context) {
    if (ConstantLists.favoriteList.contains(index)) {
      ConstantLists.favoriteList.remove(index);
      sendErrorNotification(
          context, 'Favorite', 'This Product Remove You\'re Favorite');
    } else {
      ConstantLists.favoriteList.add(index);
      sendSuccessfulNotification(
          context, 'Favorite', 'This Product Add You\'re Favorite');
    }
  }
}
