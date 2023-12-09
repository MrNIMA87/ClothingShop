import 'package:get/get.dart';

import '../constant/lists.dart';

class HomeMethod {
  isFavorite(int index) {
    if (ConstantLists.favoriteList.contains(index)) {
      ConstantLists.favoriteList.remove(index);
      Get.snackbar('Favorite', 'This Product Remove You\'re Favorite');
    } else {
      ConstantLists.favoriteList.add(index);
      Get.snackbar('Favorite', 'This Product Add You\'re Favorite');
    }
  }
}
