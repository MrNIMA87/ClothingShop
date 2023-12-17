import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../../theme/colors/general_colors.dart';

sendSuccessfulNotification(context, String title, String description) {
  return toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    title: title,
    description: description,
    showProgressBar: false,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    backgroundColor: GeneralColors.primaryColor,
    closeOnClick: false,
    dragToClose: true,
  );
}
