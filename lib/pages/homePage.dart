// ignore_for_file: prefer_const_constructors

import 'package:app/commponet/dialogBox.dart';
import 'package:app/commponet/todo_tile.dart';
import 'package:app/data/databasa.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // reference the box
  final _myBox = Hive.box('mybox');
  //text controller
  final _controller = TextEditingController();
  //list of to do task
  final ToDoDatabase _db = ToDoDatabase();

  @override
  void initState() {
    super.initState();

    //if the user is get the app for the first time
    if (_myBox.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      //already have the data
      _db.loadData();
    }
  }

  //checkbox taped
  void checkBoxchnaged(bool? value, int index) {
    setState(() {
      _db.toDoList[index][1] = !_db.toDoList[index][1];
    });
    _db.updatTheDatabase();
  }

  //save the new task
  void saveTask() {
    setState(() {
      _db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
    _db.updatTheDatabase();
  }

  //create new task
  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
            controller: _controller,
          );
        });
  }

  //delete task function
  void deleteTaskFunction(int index) {
    setState(() {
      _db.toDoList.removeAt(index);
    });
    _db.updatTheDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 163, 163),
      appBar: AppBar(
        title: Center(child: Text("To Do App")),
        backgroundColor: const Color.fromARGB(255, 146, 146, 146),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: _db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: _db.toDoList[index][0],
              taskCompleted: _db.toDoList[index][1],
              onChanged: (value) => checkBoxchnaged(value, index),
              deleteFunction: () => deleteTaskFunction(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
      ),
    );
  }
}
