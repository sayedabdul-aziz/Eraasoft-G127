import 'package:counter_app/core/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(color: AppColors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: Text(
          result.toStringAsFixed(2),
          style: const TextStyle(color: AppColors.white, fontSize: 22),
        ),
      ),
    );
  }
}

// Underweight	      < 18.5	
// Normal Weight	    18.5 - 24.9	
// Overweight	        25.0 - 29.9
// Obese class I	    30.0 - 34.9
// Obese class II	    35.0 - 39.9	
// Obese class III   	>= 40.0	

