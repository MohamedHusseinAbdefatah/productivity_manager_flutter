import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/core/constants.dart';
import 'package:productivity_manager/modules/auth/controller.dart';

import '../../../shared/widgets/auth_widgets/button.dart';
import '../../../shared/widgets/auth_widgets/text-field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              width: size.width * 0.3,
              child: Image.asset('assets/images/main_top.png'),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: size.width * 0.3,
              child: Image.asset('assets/images/main_bottom.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SIGNUP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  'assets/icons/signup.png',
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInput(
                  size,
                  "Name",
                  Icons.person,
                  controller,
                  controller.nameController,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInput(
                  size,
                  "Your Email",
                  Icons.person,
                  controller,
                  controller.emailController,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInput(
                  size,
                  'Your Password',
                  Icons.lock,
                  controller,
                  controller.passwordController,
                  isPassword: true,
                ),
                SizedBox(height: size.height * 0.03),
                CustomBUtton(size, "SIGNUP", () => controller.signup()),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account? "),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Appconstants.kprimaryclolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
