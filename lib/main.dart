
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'TaskListView.dart';

void main() {
  var state = MyState();
  state.getList();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169 TODO',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.compact,
      ),
      home: TaskListView(),
    );
  }
}