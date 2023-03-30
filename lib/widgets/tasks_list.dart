import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, TaskController, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = TaskController.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                TaskController.updateTask(task);
              },
              longPressCallback: () {
                TaskController.deleteTask(task);
              },
            );
          },
          itemCount: TaskController.taskCount,
        );
      },
    );
  }
}
