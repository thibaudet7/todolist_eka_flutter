import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';


class TaskTile extends StatelessWidget {
  const TaskTile( {super.key,
      required this.isChecked, required this.taskTitle
  ,required this.toggleCheckboxState,required this.taskIndex
  }) ;


  final bool isChecked;
  final String taskTitle;
  final int taskIndex;
  final void Function(bool?) toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return  Consumer<Data>(
      builder: (context, taskData,child) {
        return ListTile(
          onLongPress:  () {
        taskData.removeTask(taskData.tasks[taskIndex]);
        },
          title: Text(taskTitle,
            style: TextStyle(decoration: isChecked ?
            TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: toggleCheckboxState,

          ),
        );

      }
    );
  }
}






