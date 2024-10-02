import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //reference our box
  List toDoList = [];

  final _mybox = Hive.box('mybox');
  //run this method if the user is open this app for the first time
  void createInitialData() {
    toDoList = [
      ["make tetorial", false],
      ["de exercise", false]
    ];
  }

  //load data from the database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //upDate the database
  void updatTheDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
