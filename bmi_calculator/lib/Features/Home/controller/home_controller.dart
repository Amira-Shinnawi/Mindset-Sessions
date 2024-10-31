import 'dart:math';

import 'package:bmi_calculator/Features/Home/model/bmi_model.dart';
import 'package:bmi_calculator/Features/Home/view/result_bmi.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxDouble height = 150.0.obs;
  RxInt weight = 50.obs;
  RxInt age = 20.obs;
  RxBool isMale = false.obs;

  void toggleGender() {
    isMale.value = !isMale.value;
  }

  void userHeight(double value) {
    height.value = double.parse(value.toStringAsFixed(1));
  }

  void weightIncrement() {
    weight++;
  }

  void weightDecrement() {
    weight--;
  }

  void ageIncrement() {
    age++;
  }

  void ageDecrement() {
    age--;
  }

  double calculateBMI() {
    return weight.value / pow(height.value / 100, 2);
  }

  void onCalculatePressed() {
    double result = calculateBMI();
    BmiModel bmiModel = BmiModel(
      gender: isMale.value ? 'Male' : 'Female',
      age: age.value,
      height: height.value,
      weight: weight.value,
      result: result,
    );
    Get.to(() => ResultBMI(bmiModel: bmiModel));
  }

  void resetData() {
    isMale.value = false;
    age.value = 20;
    height.value = 150.0;
    weight.value = 50;
  }
}
