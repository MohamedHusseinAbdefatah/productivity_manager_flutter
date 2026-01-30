import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:productivity_manager/core/constants.dart';
import 'package:productivity_manager/modules/auth/controller.dart';

import '../../../shared/widgets/auth_widgets/button.dart';
import '../../../shared/widgets/auth_widgets/text-field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                child: Image.asset('assets/images/main_top.png')),
            Positioned(
              bottom: 0,
              left: 0,
              width: size.width * 0.3,
              child: Image.asset('assets/images/main_bottom.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/icons/login.svg',
                    height: size.height * 0.35),
                SizedBox(height: size.height * 0.03),
                //email input
                RoundedInput(size, "Your Email", Icons.person, controller,
                    controller.emailController),
                SizedBox(height: size.height * 0.03),
                //password input
                RoundedInput(
                    size,
                    'Your Password',
                    Icons.lock,
                    controller,
                    controller.passwordController,
                    isPassword: true),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width * 0.8,
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (_) => controller.toggleRememberMe(),
                          ),
                          const Text('Remember Me'),
                        ],
                      )),
                ),
                SizedBox(height: size.height * 0.03),
                CustomBUtton(
                    size,
                    "LOGIN",
                    () => controller.login(controller.emailController.text,
                        controller.passwordController.text)),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignupScreen());
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Appconstants.kprimaryclolor,
                              fontWeight: FontWeight.bold)),
                    )
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
