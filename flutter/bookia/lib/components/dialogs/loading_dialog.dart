import 'package:bookia/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DialogType { success, error }

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: .4),
    builder: (context) => Lottie.asset(AppAssets.loadingLottie),
  );
}

showMainDialog(
  BuildContext context,
  String message, [
  DialogType type = DialogType.error,
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: type == DialogType.success ? Colors.green : Colors.red,
      content: Text(message),
    ),
  );
}
