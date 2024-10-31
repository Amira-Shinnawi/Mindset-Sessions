import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
  });
  final String hintText;
  final String? labelText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ('required email');
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(
          icon,
          color: AppColor.primaryColor,
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
