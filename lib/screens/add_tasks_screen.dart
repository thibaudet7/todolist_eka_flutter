
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/main.dart';


class AddTaskScreen extends StatelessWidget {
   const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    late String newTaskTitle;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Text("Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, right: 60, left: 60),
              child: TextField(
                cursorColor: Colors.lightBlueAccent,
                autofocus: true,
                //controller: taskController,
                textAlign: TextAlign.center,
                onChanged: (String newText) {
                    newTaskTitle=newText;

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Consumer<Data>(
                builder: (context, taskData,child){
                   return ElevatedButton(
                  onPressed: ()  {

                    taskData.addNewTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent),
                  child: const Text("Add"),);}
              ),
            )
          ],
        ),
      ),
    );
  }
}