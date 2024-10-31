import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class WeightAndAge extends StatelessWidget {
  const WeightAndAge({
    super.key,
    required this.sectionName,
    this.deCerement,
    this.inCerement,
    required this.sectionValue,
  });
  final String sectionName;
  final void Function()? deCerement;
  final void Function()? inCerement;
  final int sectionValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                sectionName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    child: IconButton(
                      onPressed: deCerement,
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xFF333A22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '$sectionValue',
                      style: const TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    child: IconButton(
                      onPressed: inCerement,
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF333A22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
