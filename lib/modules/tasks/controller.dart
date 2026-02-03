import 'package:get/get.dart';
import 'package:productivity_manager/modules/tasks/model.dart';

class TasksController extends GetxController {
  final tasks = <TaskModel>[].obs;

  void addTask() {
    // Add task logic
  }

  void toggleTask(String id) {
    final index = tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      tasks[index] = tasks[index].copyWith(
        isCompleted: !tasks[index].isCompleted,
      );
    }
  }
}
