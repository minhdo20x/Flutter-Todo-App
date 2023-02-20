import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_tile.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

// class TasksList extends StatefulWidget {
//   final List<Task> tasks;
//   TasksList(this.tasks);

//   @override
//   State<TasksList> createState() => _TasksListState();
// }

// class _TasksListState extends State<TasksList> {
//   // List<Task> tasks = [
//   //   Task(name: 'Buy milk'),
//   //   Task(name: 'Buy bread'),
//   //   Task(name: 'Buy eggs')
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return TaskTile(
//             taskTitle: widget.tasks[index].name,
//             isChecked: widget.tasks[index].isDone!,
//             checkboxCallbacks: (bool? checkboxState) {
//               setState(() {
//                 //isChecked = checkboxState
//                 widget.tasks[index].toggleDone();
//               });
//             });
//       },
//       itemCount: widget.tasks.length,
//     );
//   }
// }
