import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';
import './AddTaskView.dart';
import './DropDown.dart';

// Detta är huvudvyn som appen startar i.

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
          child: Text('TIG169 TODO', textAlign: TextAlign.center, style: TextStyle(fontSize: 26)),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (choice) {
            var state = Provider.of<MyState>(context, listen: false);
            state.filterChange(choice);
          }, 
          itemBuilder: (BuildContext context) {
            return DropDown.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: (choice),
                child: Text(choice),
              );
            }).toList();
          })
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TaskList(state.listFiltered),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
        onPressed: () async {
          var newTask = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddTaskView(TaskItem(input: null, status: false))));
          if (newTask != null) {
            Provider.of<MyState>(context, listen: false).addTask(newTask);
          }
        },
      ),
    );
}
// Drop-down meny i huvudvyn
void choiceAction(String choice) {
    if (choice == DropDown.all) {
      Filter.show = "all";
    } else if (choice == DropDown.done) {
      Filter.show = "done";
    } else if (choice == DropDown.undone) {
      Filter.show = "notDone";
    }
  }
}

class TaskList extends StatelessWidget {
  final List<TaskItem> listFiltered;

  TaskList(this.listFiltered);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            listFiltered.map((task) => taskWidget(context, task)).toList());
  }
}

// Widget som definierar hur task row ska se ut i vyn, även möjliga förändringar i status
// Något här eller i TaskList är galet då jag ej kan lägga till nya tasks utan felmeddelande 
Widget taskWidget(context, task) {
    return Card(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Expanded(
                  child: Text(task.input,
                  style: TextStyle(
                  fontSize: 26.0,
                  decoration: task.status == false
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                  decorationThickness: 3.0)),
        ),
        value: task.status,
        onChanged: (bool newValue) {
          var state = Provider.of<MyState>(context, listen: false);
          state.toggleTask(task, newValue);
        },
        secondary: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTask(task);
          },
        ),
      ),
    );
  }


