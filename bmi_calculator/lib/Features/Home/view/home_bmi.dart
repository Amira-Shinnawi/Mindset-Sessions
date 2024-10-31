import 'package:bmi_calculator/Features/Home/view/widgets/gender.dart';
import 'package:bmi_calculator/Features/Home/view/widgets/slider.dart';
import 'package:bmi_calculator/Features/Home/view/widgets/weight_age.dart';
import 'package:bmi_calculator/Features/Login/view/login_screen.dart';
import 'package:bmi_calculator/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/shared_pref.dart';
import '../controller/home_controller.dart';

class HomeBMI extends StatelessWidget {
  const HomeBMI({super.key});
  @override
  Widget build(BuildContext context) {
    String? pass = CachedData.getData(key: "Pass");

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ,$pass'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                CachedData.deleteData(key: "Email");
                CachedData.deleteData(key: "Pass");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: GetX(
              init: BMIController(),
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Gender(
                              icon: Icons.female,
                              genderName: 'Female',
                              genderTap: controller.toggleGender,
                              genderCheck: controller.isMale.value
                                  ? const Color(0xffDAFA87).withOpacity(.1)
                                  : const Color(0xffDAFA87).withOpacity(.4),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Gender(
                              icon: Icons.male,
                              genderName: 'Male',
                              genderTap: controller.toggleGender,
                              genderCheck: controller.isMale.value
                                  ? const Color(0xffDAFA87).withOpacity(.4)
                                  : const Color(0xffDAFA87).withOpacity(.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: HeightSlider(
                        height: controller.height.value,
                        onChanged: controller.userHeight,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: WeightAndAge(
                            sectionName: 'Weight',
                            sectionValue: controller.weight.value,
                            inCerement: controller.weightIncrement,
                            deCerement: controller.weightDecrement,
                          )),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: WeightAndAge(
                            sectionName: 'Age',
                            sectionValue: controller.age.value,
                            inCerement: controller.ageIncrement,
                            deCerement: controller.ageDecrement,
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      buttonName: 'Calculate',
                      onPressed: () {
                        controller.onCalculatePressed();
                      },
                    ),
                  ],
                );
              })),
    );
  }
}
