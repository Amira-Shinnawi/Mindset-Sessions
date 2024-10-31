import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.buttonName});
  final void Function()? onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: MediaQuery.of(context).size.height * .05,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColor.primaryColor,
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonName.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(
              0xFF333A22,
            ),
          ),
        ),
      ),
    );
  }
}
