import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  String? newTaskTitle;

  Widget build(BuildContext context) {
    return Container(
      color: tdGrey,
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              textAlign: TextAlign.center,
              'Add Task',
              style: TextStyle(
                  fontSize: 30, color: tdPink, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                hintText: 'something todo',
                isDense: true,
              ),
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    } else
                      return tdPink;
                  },
                ),
              ),
              onPressed: () {
                Provider.of<TaskController>(context, listen: false).addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Widget AddTaskScreen(BuildContext context) {
  
  // final Function addTaskCallback;

  // AddTaskScreen(this.addTaskCallback);
//   String? newTaskTitle;

//   //double HeightScreen = MediaQuery.of(context).size.height;
//   
//    
// }
