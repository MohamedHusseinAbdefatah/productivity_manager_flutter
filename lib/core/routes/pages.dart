import 'package:get/get.dart';
import 'package:productivity_manager/core/middleware/auth_middleware.dart';
import 'package:productivity_manager/core/routes/routes.dart';
import 'package:productivity_manager/modules/Home/home_screen.dart';
import 'package:productivity_manager/modules/auth/bindings.dart';
import 'package:productivity_manager/modules/auth/view/login_screen.dart';
import 'package:productivity_manager/modules/auth/view/signup_screen.dart';
import 'package:productivity_manager/modules/notebook/bindings.dart';
import 'package:productivity_manager/modules/notebook/view/notebook_screen.dart';
import 'package:productivity_manager/modules/notes/bindings.dart';
import 'package:productivity_manager/modules/notes/view/notes_screen.dart';
import 'package:productivity_manager/modules/tasks/bindings.dart';
import 'package:productivity_manager/modules/tasks/view/tasks_screen.dart';

import '../../modules/notes/view/note_details.dart';

class AppPages {
  AppPages._();

  static final pages = [
    // Auth Routes (no middleware needed)
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: AuthBindings(),
    ),
    // Protected Routes (with auth middleware)
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: AuthBindings(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.notebook,
      page: () => NoteBookScreen(),
      binding: NotebookBindings(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.notes,
      page: () => const NotesScreen(),
      binding: NotesBindings(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.tasks,
      page: () => const TasksScreen(),
      binding: TasksBindings(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.noteDetail,
      page: () => NoteDetails(),
      // middlewares: [AuthMiddleware()],
    ),
  ];
}
