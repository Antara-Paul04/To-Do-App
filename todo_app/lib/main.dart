import 'package:flutter/material.dart';
import './widgets/tasks.dart';
import './models/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD1C1F2),
            title: Text("Todo List"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBox(),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 40, 0),
                child: Text(
                  "Your ToDos",
                  style: TextStyle(
                    color: Color(0xFF745E96),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    for (ToDo todoo in todosList)
                      Column(
                        children: [
                          Tasks(todo: todoo),
                          SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Color(0xFF745E96)),
        ),
        prefixIcon: Icon(Icons.search, color: Color(0xFF745E96), size: 20),
        hintText: "Search for your tasks",
      ),
    ),
  );
}
