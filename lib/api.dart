import 'dart:convert';
import 'package:http/http.dart' as http;
import './model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '72457c8f-f462-4605-91ac-7ec61b1a6473';

class Api {
  
  // http.post task - lägger till en ny task 
  static Future addTaskApi(TaskItem task) async {
    print(task);
    Map<String, dynamic> json = TaskItem.toJson(task);
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic> {
        'title': task.input,
        'done': task.status,
      }));
    print('done');
  }

// http.delete task - tar bort task
  static Future removeTaskApi(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');

  }

// http.put - uppdaterar task med id 
  static Future updateTaskApi(TaskItem task) async {
    print(task);
    Map<String, dynamic> json = TaskItem.toJson(task);
    print(json);
    var taskid = task.taskId;
    await http.put('$API_URL/todos/$taskid?key=$API_KEY',
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(<String, dynamic> {
      'title': task.input,
      'done': task.status,
    }));
    print('done');    
  }

  static Future<List<TaskItem>> fetchList() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);

    return json.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }
} 
