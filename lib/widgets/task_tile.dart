import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() longPressCallback;

  const TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: tdPink,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListTile(
        onLongPress: longPressCallback,
        dense: true,
        title: Text(
          taskTitle!,
          style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.green,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
