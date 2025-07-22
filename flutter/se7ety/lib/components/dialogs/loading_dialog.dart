import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/core/constants/app_assets.dart';
import 'package:se7ety/core/extensions/navigation.dart';
import 'package:se7ety/core/routers/routers.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

enum DialogType { success, error }

void showLoadingDialog(BuildContext context) {
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

void showMainDialog(
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

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      alignment: Alignment.center,
      backgroundColor: AppColors.accentColor,
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(
        'تم تأكيد الحجز بنجاح',
        textAlign: TextAlign.center,
        style: getTitleStyle(color: AppColors.darkColor),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              width: 100,
              height: 35,
              onPressed: () {
                context.pushToBase(Routes.patientMainApp);
              },
              text: 'حسنا',
            ),
          ],
        ),
      ],
    ),
  );
}
