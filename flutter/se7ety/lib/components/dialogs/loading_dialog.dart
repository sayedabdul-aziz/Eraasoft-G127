import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/app_assets.dart';

enum DialogType { success, error }

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: .5),
    builder: (context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset(AppAssets.loadingLottie, width: 250)],
    ),
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
