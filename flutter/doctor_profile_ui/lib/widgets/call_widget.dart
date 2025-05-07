import 'package:flutter/material.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.call), Text(number)],
      ),
    );
  }
}
