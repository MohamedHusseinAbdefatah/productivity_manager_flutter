import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/core/constants.dart';
import 'package:productivity_manager/modules/auth/controller.dart';
import 'package:productivity_manager/shared/widgets/auth_widgets/text-field.dart';

import '../../../shared/widgets/auth_widgets/button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Appconstants.kdefpadding * 2, 0, Appconstants.kdefpadding * 2, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/icons/signup.png', height: size.height * 0.35),
              RoundedInput(size, "Enter your Name", Icons.person, controller,
                  controller.nameController),
              SizedBox(height: size.height * 0.03),
              RoundedInput(size, "Enter your Email", Icons.email, controller,
                  controller.emailController),
              SizedBox(height: size.height * 0.03),
              RoundedInput(
                  size,
                  "Enter your Password",
                  Icons.lock,
                  controller,
                  controller.passwordController,
                  isPassword: true),
              SizedBox(height: size.height * 0.03),
              RoundedInput(
                  size,
                  "Re-Enter your Password",
                  Icons.lock,
                  controller,
                  controller.confirmPasswordController,
                  isPassword: true),
              SizedBox(height: size.height * 0.03),
              CustomBUtton(size, "SIGN UP", () => controller.signup()),
              SizedBox(height: size.height * 0.02),
              Divider(color: Appconstants.kprimaryclolor),
              Text("Or sign up with",
                  style: TextStyle(color: Appconstants.ktextlightcolor)),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/icons/apple_icon.jpg'),
                      height: 50),
                  SizedBox(width: size.width * 0.05),
                  Image(
                      image: AssetImage('assets/icons/facebook_icon.jpg'),
                      height: 50),
                  SizedBox(width: size.width * 0.05),
                  Image(
                      image: AssetImage('assets/icons/google_icon.jpg'),
                      height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
