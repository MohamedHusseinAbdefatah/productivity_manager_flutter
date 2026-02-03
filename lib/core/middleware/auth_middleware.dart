// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:productivity_manager/core/routes/routes.dart';
// import 'package:productivity_manager/core/storage/auth_storage.dart';

// class AuthMiddleware extends GetMiddleware {
//   final authStorage = AuthStorage();

//   @override
//   RouteSettings? redirect(String? route) {
//     final token = authStorage.getToken();
//     if (token == null || token.isEmpty) {
//       // No token, redirect to login
//       if (route != AppRoutes.login && route != AppRoutes.signup) {
//         return const RouteSettings(name: AppRoutes.login);
//       }
//     } else {
//       // Has token, redirect to notebook if trying to access login/signup
//       if (route == AppRoutes.login || route == AppRoutes.signup) {
//         return const RouteSettings(name: AppRoutes.notebook);
//       }
//     }
//     return null;
//   }
// }
