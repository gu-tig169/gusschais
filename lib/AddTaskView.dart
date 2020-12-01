import 'package:flutter/material.dart';
import './model.dart';

class AddTaskView extends StatefulWidget {
  final TaskItem task;
  
  AddTaskView(this.task);

  @override
  State<StatefulWidget> createState() {
    return AddTaskState(task);
  }
}

class AddTaskState extends State<AddTaskView> {
  String input;
  bool status;

  TextEditingController textEditingController;

  AddTaskState(TaskItem task) {
    this.input = task.input;
    this.status = task.status;

    textEditingController = TextEditingController(text: task.input);
    textEditingController.addListener(() {
      setState(() {
        input = textEditingController.text;
      });
    });
  }

@override
Widget build(BuildContext context) {
  var outLinedButton = OutlinedButton(
    onPressed: () {
      Navigator.pop(context, TaskItem(input: input, status: status));
    }, 
    child: Text(
      '+ ADD', 
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
  );
  return Scaffold(
    appBar: AppBar(
      title: Text('TIG169 TODO', style: TextStyle(fontSize: 26.0)),
      centerTitle: true,
      backgroundColor: Colors.grey,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 5),
          _textField(),
          Container(height: 50),
          outLinedButton,
        ],
      ),
    ),
  );
}

 Widget _textField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      width: 500.0,
      child: TextField(
        style: TextStyle(
          fontSize: 21.0,
        ),
        controller: textEditingController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'What are you going to do?'),
      ),
    );
  }
}
