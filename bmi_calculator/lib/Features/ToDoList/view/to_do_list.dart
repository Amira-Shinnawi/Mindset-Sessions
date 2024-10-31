import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import 'edit_task.dart';

class TaskScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Feature 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Feature 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController.taskController,
                    decoration: const InputDecoration(labelText: 'Enter Task'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(taskController.tasks[index]),
                        trailing: InkWell(
                          onTap: () => taskController.removeTask(index),
                          child: const Icon(Icons.delete, color: Colors.red),
                        ),
                        onTap: () {
                          Get.to(() => EditTaskScreen(taskIndex: index,));
                        },
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
        child: IconButton(
          onPressed: taskController.addTask,
          icon: const Icon(
            Icons.add,
            size: 25,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
