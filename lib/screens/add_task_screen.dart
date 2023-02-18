import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

Widget buildBottomSheet(BuildContext context) {
  //double HeightScreen = MediaQuery.of(context).size.height;
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
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: tdPink,
                  width: 3,
                ),
              ),
              hintText: 'something todo',
              isDense: true,
            ),
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
            onPressed: () {},
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
