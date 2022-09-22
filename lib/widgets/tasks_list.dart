import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/main.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';


class TaskList extends StatelessWidget {
  const TaskList({super.key, });

  //final List<Task> newTasks;

  @override
  Widget build(BuildContext context) {

    return Consumer<Data>(
      builder: (context, taskData,child){

        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index){

              return TaskTile(
                  isChecked: taskData.tasks[index].isDone,
                  taskTitle:taskData.tasks[index].name,
                  toggleCheckboxState: (checkboxState) {
                    taskData.updateTask(taskData.tasks[index]);
                  },
                  taskIndex: index,

              ) ;


            });

      },

    );
  }
}

