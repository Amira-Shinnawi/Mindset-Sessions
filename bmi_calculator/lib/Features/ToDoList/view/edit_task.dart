// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';

class EditTaskScreen extends StatelessWidget {
  EditTaskScreen({
    super.key,
    required this.taskIndex,
  });
  final int taskIndex;
  final taskController = Get.find<TaskController>();
  final TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    editController.text = taskController.tasks[taskIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: editController,
              decoration: const InputDecoration(labelText: 'Edit Task'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                taskController.updateTask(taskIndex, editController.text);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
