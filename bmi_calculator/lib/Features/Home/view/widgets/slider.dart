import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    super.key,
    required this.height,
    this.onChanged,
  });

  final double height;
  final void Function(double)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                    text: '$height',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                          text: ' Cm',
                          style: TextStyle(
                            fontSize: 18,
                          ))
                    ]),
              ),
              Slider(
                activeColor: AppColor.primaryColor,
                inactiveColor: const Color.fromARGB(255, 79, 94, 46),
                value: height,
                max: 200,
                label: height.round().toString(),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
