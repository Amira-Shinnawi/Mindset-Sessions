import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/shared_pref.dart';

class TaskController extends GetxController {
  RxList<String> tasks = <String>[].obs;
  TextEditingController taskController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void saveTasks() {
    //save task
    CachedData.sharedPref.setStringList('tasks', tasks);
  }

  Future<void> loadTasks() async {
    //Load All Tasks
    List<String>? savedTasks = CachedData.sharedPref.getStringList('tasks');
    if (savedTasks != null) {
      tasks.addAll(savedTasks);
    }
  }

  void addTask() {
    String task = taskController.text;
    if (task.isNotEmpty) {
      tasks.add(task);
      taskController.clear();
      saveTasks();
      Get.snackbar('Task Added', 'Task Added: $task');
    }
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
    Get.snackbar('Task Removed', 'Task Removed');
  }

  void updateTask(int index, String updatedTask) {
    tasks[index] = updatedTask;
    saveTasks(); // Save changes to SharedPreferences
    Get.back();
    Get.snackbar('Task Updated', 'Your task has been updated');
  }
}
