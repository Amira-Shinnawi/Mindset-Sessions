import 'package:bmi_calculator/Features/Login/view/login_screen.dart';
import 'package:bmi_calculator/core/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Features/ToDoList/view/to_do_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedData.cacheInitialization();
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = CachedData.getData(key: "Email");
    String? pass = CachedData.getData(key: "Pass");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: email != null && pass != null ? TaskScreen() : LoginScreen(),
      theme: ThemeData.light(),
    );
  }
}
