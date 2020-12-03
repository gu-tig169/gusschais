import 'package:flutter/material.dart';
import 'DropDown.dart';
import './api.dart';

// Definierar vad varje task består av, en string som kallas input och en status  
class TaskItem {
  String input;
  String taskId;
  bool status = false;
  
  TaskItem({this.input, this.taskId, this.status});

  static Map<String, dynamic> toJson(TaskItem task) {
    return {
      'title': task.input,
      'done': task.status,
    };
  }

  static TaskItem fromJson(Map<String, dynamic> json) {
    return TaskItem(
      input: json['title'],
      taskId: json['id'],
      status: json['done'],
      );
    }
 }

class MyState extends ChangeNotifier {
  List<TaskItem> _listFetched = [];
  List<TaskItem> get listFetched => _listFetched;

  Future getList() async {
    List<TaskItem> list = await Api.fetchList();
    _listFetched = list;
    notifyListeners();
  }

// Nedan funktion tillåter tasks att läggas in i nätverket
void addTask(TaskItem task) async {
  if (task.input == null) {
    await getList();
  }
  else {
    await Api.addTaskApi(task);
    await getList();
    }
  }

// Nedan funktion tillåter tasks att tas bort från nätverket
void removeTask(TaskItem task) async {
  await Api.removeTaskApi(task.taskId);
  await getList();
  }
  
// Nedan funktion tillåter förändring av task i nätverket
void toggleTask(TaskItem task, bool newValue) async {
  task.status = newValue;
  await Api.updateTaskApi(task);
  await getList();
}

// Nedan funktion tillåter filtrering av tasks i listor
void filterChange(String choice) async {
  Filter.show = choice;
  await Api.fetchList();
  await getList();
  filteredList(choice);
  notifyListeners();
  }

// Tillhör filtrerings-dropdown 
void filteredList(String choice) {
  if (choice == "all") {
    _listFetched = listFetched.toList();
    } else if (choice == "undone") {
    _listFetched = listFetched.where((task) => task.status == false).toList();
    } else if (choice == "done") {
    _listFetched = listFetched.where((task) => task.status == true).toList();
    }
  }
}


