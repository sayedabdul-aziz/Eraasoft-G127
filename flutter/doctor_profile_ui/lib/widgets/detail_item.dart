import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.indigo,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
