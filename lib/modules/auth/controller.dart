import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/modules/auth/view/login_screen.dart';
import '../../core/storage/auth_storage.dart';
import '../Home/home_screen.dart';
import 'auth_api.dart';
import 'user_model.dart';

class AuthController extends GetxController {
  final isPasswordHidden = false.obs;
  final rememberMe = false.obs;

  final isLoggedIn = false.obs;
  final currentUser = Rxn<User>();

  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  // Text controllers for binding to inputs
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthApiService api = AuthApiService();
  final AuthStorage storage = AuthStorage();

  void togglePassword() {
    isPasswordHidden.toggle();
  }

  void toggleRememberMe() {
    rememberMe.toggle();
  }

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> login(String email, String password) async {
    try {
      final token = await api.login(email, password);
      if (token == null) throw Exception('No token returned');
      if (rememberMe.value) {
  storage.saveToken(token);
}
      isLoggedIn.value = true;
      Get.off(HomeScreen())  ;
    } catch (e) {
      final msg = e is Exception ? e.toString() : 'Invalid credentials';
      Get.snackbar('Error', msg);
    }
  }

  Future<void> signup() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirm = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields');
      return;
    }
    if (password != confirm) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      final response = await api.signup(name, email, password);
      if (response != null) {
        
      
      } else {
        Get.snackbar('Success', 'Account created — please login');
        Get.to(LoginScreen());
      }
    } catch (e) {
      final msg = e is Exception ? e.toString() : 'Signup failed';
      Get.snackbar('Error', msg);
    }
  }

void logout() {
  storage.clearToken();
  currentUser.value = null;
  isLoggedIn.value = false;
  Get.offAll(() => LoginScreen());
}

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
