import 'package:bmi_calculator/Features/Home/view/home_bmi.dart';
import 'package:bmi_calculator/core/services/shared_pref.dart';
import 'package:bmi_calculator/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import 'widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 14),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    labelText: 'Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    controller: passController,
                    hintText: 'Password',
                    labelText: 'pass',
                    icon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    buttonName: 'login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        CachedData.setDate(
                            key: "Email", value: emailController.text);
                        CachedData.setDate(
                            key: "Pass", value: passController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeBMI(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
