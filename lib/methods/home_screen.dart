import 'package:clothing_shop/view/widgets/notifications/eror_notification.dart';
import 'package:clothing_shop/view/widgets/notifications/successful_notification.dart';

import '../constant/lists.dart';

class HomeMethod {
  isFavorite(int index, context) {
    if (ConstantLists.favoriteList.contains(index)) {
      if (ConstantLists.favoriteList.length == 1) {
        ConstantLists.favoriteList.clear();
        sendErrorNotification(
          context,
          'Favorite',
          'You do not have a favorite product!',
        );
      } else {
        ConstantLists.favoriteList.remove(index);
      }
    } else {
      ConstantLists.favoriteList.add(index);
      sendSuccessfulNotification(
        context,
        'Favorite',
        'This Product Add You\'re Favorite',
      );
    }
  }
}
