import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../core/constants.dart';

Widget RoundedInput(
  Size size,
  String hinttext,
  IconData icon,
  controller,
  TextEditingController? textController, {
  bool isPassword = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Appconstants.kbgcolor,
    ),
    width: size.width * 0.8,
    child: isPassword
        ? Obx(() => TextField(
              controller: textController,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: hinttext,
                prefixIcon: Icon(
                  icon,
                  color: Appconstants.kprimaryclolor,
                ),
                suffixIcon: IconButton(
                  onPressed: controller.togglePassword,
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                border: InputBorder.none,
              ),
            ))
        : TextField(
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              hintText: hinttext,
              prefixIcon: Icon(
                icon,
                color: Appconstants.kprimaryclolor,
              ),
              border: InputBorder.none,
            ),
          ),
  );
}
