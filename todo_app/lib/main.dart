import 'package:flutter/material.dart';
import './widgets/tasks.dart';
import './models/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final todosList = ToDo.todoList();

  void handleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

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
          body: Stack(
            children: [
              Column(
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
                        for (ToDo todo in todosList)
                          Column(
                            children: [
                              Tasks(
                                todo: todo,
                                onTodoChanged: handleTodoChange,
                                onDeleteItem: deleteItem,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0xFF745E96),
                              ),
                            ),
                            hintText: "Add new task",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFD1C1F2),
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Add button was pressed");
                          },
                          icon: Icon(Icons.add),
                          color: Colors.black,
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
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
        contentPadding: EdgeInsets.all(20),
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
