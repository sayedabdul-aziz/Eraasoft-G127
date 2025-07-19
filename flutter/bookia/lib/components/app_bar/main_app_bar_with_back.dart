import 'package:bookia/components/buttons/main_back_button.dart';
import 'package:flutter/material.dart';

class MainAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  const MainAppBarWithBack({super.key, this.action});

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MainBackButton(),
      actions: [action ?? Container()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
