import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
  });
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^\s+'))],
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: 50),
      ),
    );
  }
}
