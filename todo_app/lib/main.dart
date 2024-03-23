import 'package:flutter/material.dart';
import './widgets/tasks.dart';
import './models/todo.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ToDo> todosList = [];
  final Uuid uuid = Uuid();
  final TextEditingController _textEditingController = TextEditingController();
  List<ToDo> foundTodo = [];

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

  void addItem(String taskText) {
    String id = uuid.v4();
    setState(() {
      todosList.add(ToDo(id: id, todoText: taskText));
      _textEditingController.clear();
    });
  }

  @override
  void initState() {
    foundTodo = todosList;
    super.initState();
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
                  todosList.isEmpty? Padding(
                          padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
                          child: Text(
                            "Add your Tasks to get started",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: ListView(
                              children: [
                                for (ToDo todo in foundTodo)
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
                          controller: _textEditingController,
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
                            addItem(_textEditingController.text.trim());
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

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: TextField(
        onChanged: (value) => _searchItem(value),
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

  void _searchItem(String search) {
    List<ToDo> results = [];
    if (search.isEmpty) {
      results = todosList;
    } else {
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(search.toLowerCase())).toList();
    }

    setState(() {
      foundTodo = results;
    });
  }
}
