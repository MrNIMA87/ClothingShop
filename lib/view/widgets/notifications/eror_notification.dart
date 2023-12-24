import 'package:clothing_shop/theme/colors/general_colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

sendErrorNotification(context, String title, String description) {
  return toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: title,
    description: description,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 4),
    borderRadius: BorderRadius.circular(12.0),
    backgroundColor: GeneralColors.primaryColor,
    closeOnClick: false,
    dragToClose: true,
    showProgressBar: false,
  );
}
