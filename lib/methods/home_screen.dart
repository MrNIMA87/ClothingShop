import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/lists.dart';

class HomeMethod {
  isFavorite(int index) {
    if (ConstantLists.favoriteList.contains(index)) {
      ConstantLists.favoriteList.remove(index);
      Get.snackbar(
        'Favorite',
        'This Product Remove You\'re Favorite',
        backgroundGradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black87,
          ],
        ),
        barBlur: 2,
        icon: Icon(Icons.remove_circle_outline),
      );
    } else {
      ConstantLists.favoriteList.add(index);
      Get.snackbar(
        'Favorite',
        'This Product Add You\'re Favorite',
        backgroundGradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black87,
          ],
        ),
        barBlur: 2,
        icon: Icon(Icons.add_circle_outline),
      );
    }
  }
}
