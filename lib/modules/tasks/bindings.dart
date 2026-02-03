import 'package:get/get.dart';
import 'package:productivity_manager/modules/tasks/controller.dart';

class TasksBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TasksController());
  }
}
