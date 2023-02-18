import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class TaskTile extends StatelessWidget {
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {
  final bool? isChecked;
  final String? taskTitle;
  final Function(bool?) checkboxCallbacks;

  const TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallbacks});

  // void checkboxCallBack(bool? checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState!;
  //   });
  // }

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
          onChanged: checkboxCallbacks,
        ),
      ),
    );
  }
}

// class CheckBox extends StatelessWidget {
//   final bool? checkBoxState;
//   final Function(bool?) toggleCheckBoxState;

//   CheckBox({this.checkBoxState, required this.toggleCheckBoxState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.green,
//       value: checkBoxState!,
//       onChanged: toggleCheckBoxState,
//     );
//   }
// }
