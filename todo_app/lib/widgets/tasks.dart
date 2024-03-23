import 'package:flutter/material.dart';
import '../models/todo.dart';

class Tasks extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onTodoChanged;
  final Function(String) onDeleteItem;

  const Tasks({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        contentPadding: EdgeInsets.fromLTRB(20, 5, 10, 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: todo.isDone ? Color.fromARGB(255, 173, 149, 221) : Color(0xFFD1C1F2),
        leading: todo.isDone
            ? Icon(
                Icons.check_box,
                color: Color.fromARGB(255, 99, 62, 154),
              )
            : Icon(
                Icons.check_box_outline_blank,
                color: Color.fromARGB(255, 99, 62, 154),
              ),
        title: Row(
          children: [
            Text(
              todo.todoText!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                onDeleteItem(todo.id.toString());
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
