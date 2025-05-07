import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.bgColor = Colors.indigo,
    required this.text,
    this.height = 45,
    this.width = double.infinity,
    this.radius = 10,
    required this.onPressed,
  });
  final Color bgColor;
  final String text;
  final double height;
  final double width;
  final double radius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
