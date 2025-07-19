import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> pushTo(BuildContext context, Widget newScree) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => newScree),
    );
  }

  void pushReplacementTo(BuildContext context, Widget newScree) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newScree),
    );
  }
}
