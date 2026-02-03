import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_manager/modules/tasks/controller.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TasksController());

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (value) => controller.toggleTask(task.id),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addTask(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
