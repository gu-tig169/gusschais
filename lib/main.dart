import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

// Huvudvyn

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.grey),
        centerTitle: true,
        title: Text('TIG169 TODO'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right), 
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondView()), 
                );
              },
            ),
          ],
        ),
     body: Stack(
       children: [ 
         _floatingButton(),
         _shittyList(), 
       ],
     ),
    );
  }
}

// Floating button, fick ej till Navigation, då 'context' klagade

 Widget _floatingButton() {
    return Scaffold(     
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
              // Navigator.push(
              //  context,
              //  MaterialPageRoute(builder: (context) => SecondView()), 
              //  );
              },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
        
      ),
    );
  }

// Nedan följer min väldigt skämmiga fejklista. 

Widget _shittyList() {
  return Column(
    children: [
      _itemOne(),
      _itemTwo(),
      _itemThree(),
      _itemFour(),
      _itemFive(),
      _itemSix(),
      _itemSeven(),
      _itemEight(), 
    ],
  );
}

// Och sen en massa kod på nästan identiska item-widgets.
// Önskar feedback på hur man kunnat aligna checkbox-text-icons så de ej blir centrerade 
// (som de blivit med spaceBetween).

Widget _itemOne() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Write a book', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemTwo() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Do homework', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemThree() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: true,
        activeColor: (Colors.grey),
        onChanged: (val) {}
      ),
      Expanded(child: Text('Tidy room', style: TextStyle(
          fontSize: 26, 
          decoration: TextDecoration.lineThrough),
          ),
      ),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemFour() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Watch TV', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemFive() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Nap', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemSix() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Shop groceries', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemSeven() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Have fun', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

Widget _itemEight() {
  return Container (
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
      ),
    ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {}
      ),
      Expanded(child: Text('Meditate', style: TextStyle(fontSize: 26))),
      Icon(Icons.close),
    ],
  ),
  ); 
}

// Andra vyn

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.grey),
        title: Text('TIG169 TODO')),
      body: Center( 
        child: Column(
          children: [
            _textField(),
            _addRow(),
          ],
        )
      )
    );
  }
}

// Widgets som syns på andra vyn följer nedan

Widget _textField() {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, top: 30),
    height: 50,
    child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'What are you going to do?',
          ),
        ),
      );
  }

Widget _addRow() {
  return Center(
    child: Container(
        margin: EdgeInsets.only(left: 165),
        height: 100,
        child: Row(
          children: [
              Icon(Icons.add),
              Text('ADD', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
        ),
      ),
    );
}