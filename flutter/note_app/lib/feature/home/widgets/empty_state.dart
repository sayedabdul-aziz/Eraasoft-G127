import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.hourglass_empty_rounded, color: Colors.white, size: 100),
          SizedBox(height: 10),
          Text('No notes', style: TextStyle(color: Colors.white, fontSize: 25)),
        ],
      ),
    );
  }
}
