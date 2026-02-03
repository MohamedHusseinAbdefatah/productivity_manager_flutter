import 'package:get/get.dart';
import 'package:productivity_manager/modules/auth/controller.dart';
import 'package:productivity_manager/modules/notebook/notebook_controller.dart';

class NotebookBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotebookController());
    Get.put(AuthController());
  }
}
