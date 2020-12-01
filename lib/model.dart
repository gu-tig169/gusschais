import 'package:flutter/material.dart';
import './DropDown.dart';

// Definierar vad varje task består av, en string som kallas input och en status  
class TaskItem {
  String input;
  bool status = false;
  TaskItem({this.input, this.status});
  }

class MyState extends ChangeNotifier {
  List<TaskItem> _list = [];
  List<TaskItem> get list => _list;
  List<TaskItem> _filteredList = [];
  List<TaskItem> get listFiltered => _filteredList;

// Nedan funktion tillåter tasks att läggas in i listorna
void addTask(TaskItem task) {
  _list.add(task);
  _filteredList = list.where((task) => task.input == task.input).toList();
  notifyListeners();
}

// Nedan funktion tillåter tasks att tas bort från listorna
void removeTask(TaskItem task) {
  _list.remove(task);
  _filteredList.remove(task);
  notifyListeners();
}

// Nedan funktion tillåter förändring av task status
void toggleTask(TaskItem task, bool newValue) {
  task.status = newValue;
  notifyListeners();
}

// Nedan funktion tillåter filtrering av tasks i listor
void filterChange(String choice) {
  Filter.show = choice;
  filteredList(choice);
  notifyListeners();
  }

// Tillhör filtrerings-dropdown 
List<TaskItem> filteredList(String choice) {
  _filteredList.clear();
  if (choice == 'Complete') {
    _filteredList = list.where((task) => task.status == true).toList();
    return _filteredList;
  }
  else if (choice == 'Incomplete') {
    print('Incomplete');
    _filteredList = list.where((task) => task.status == false).toList();
    return _filteredList;
  }
  else if (choice == 'All') {
    print('All');
    _filteredList = list.where((task) => task.input == task.input).toList();
    return _filteredList;
  }
  return _filteredList;
 
   }
 }


