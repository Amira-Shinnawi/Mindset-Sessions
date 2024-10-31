import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  const Gender({
    super.key,
    this.icon,
    required this.genderName,
    required this.genderTap,
    required this.genderCheck,
  });
  final IconData? icon;
  final String genderName;
  final void Function() genderTap;
  final Color genderCheck;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: genderTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: genderCheck,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 100,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  genderName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
