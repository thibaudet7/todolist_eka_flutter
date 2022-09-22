import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/screens/add_tasks_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/main.dart';



class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
showModalBottomSheet(
    context: context,
    builder: (context)
  =>   const AddTaskScreen()
  );
 },   child: const Icon(Icons.add),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,),
                ),
                const SizedBox(height: 30,),
                const Text('Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700
                ),),
                Text('${Provider.of<Data>(context).taskCount}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700
                  ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:  const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
              ),
              child:const TaskList(),
            ),
          )
        ],
      ),

    );
  }
}

