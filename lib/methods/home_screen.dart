import 'package:get/get.dart';

import '../constant/lists.dart';

class HomeMethod {
  isFavorite(RxInt index) {
    if (ConstantLists.favoriteList.contains(index)) {
      ConstantLists.favoriteList.remove(index);
    } else {
      ConstantLists.favoriteList.add(index);
    }
  }
}
