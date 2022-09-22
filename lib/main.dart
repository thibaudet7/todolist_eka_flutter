import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<Data>(
      create:(context)=>Data(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}



class Data extends ChangeNotifier{

  final  List<Task> _tasks= [
    Task(name:"Buy milk"),
    Task(name:"Buy eggs"),
    Task(name:"Buy bread")
  ] ;

String data='Jesus is the Truth';



  void updateTask (Task task) {

    task.toggleDone();
    notifyListeners();
  }

  void addNewTask(String newTaskTitle){

    final task =Task(name: newTaskTitle);
    _tasks.add(task);
   notifyListeners();

  }
  void removeTask(Task task){

    _tasks.remove(task);
    notifyListeners();

  }


UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);

}


  int get taskCount {
    return _tasks.length;
  }

}

