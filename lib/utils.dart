import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';


Future<void> showToast(
    BuildContext context, {
      Widget? title,
      required Widget description,
      ToastificationType? type = ToastificationType.info,
      ToastificationStyle? style = ToastificationStyle.flat,
      AlignmentGeometry? alignment,
      Color? primaryColor,
      Duration? duration = const Duration(seconds: 14),
      Color? backgroundColor,
      Color? foregroundColor = Colors.white,

      bool? blurEffect = false,
    }) async {
  toastification.show(
    context: context,
    borderRadius: BorderRadius.circular(100.0),
    showProgressBar: true,
    dragToClose: true,
    type: type,
    style: style,
    title: title,
    alignment: alignment,
    description: description,
    autoCloseDuration: duration,
    backgroundColor: backgroundColor,
    applyBlurEffect: blurEffect,
    foregroundColor: foregroundColor,
    primaryColor: type == ToastificationType.info
        ? Colors.deepPurple.shade600
        : Colors.white,
  );

}