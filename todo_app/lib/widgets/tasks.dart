import 'package:flutter/material.dart';
import '../models/todo.dart';

class Tasks extends StatelessWidget {
  final ToDo todo;

  const Tasks({Key? key, required this.todo}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(20,5,10,5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Color(0xFFD1C1F2),
        leading: todo.isDone? Icon(
          Icons.check_box, 
          color:Color.fromARGB(255, 99, 62, 154),
          ): Icon(
            Icons.check_box_outline_blank, 
            color: Color.fromARGB(255, 99, 62, 154)),
        title: Row(
          children: [
            Text(
              todo.todoText!, 
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: todo.isDone? TextDecoration.lineThrough: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(180, 8,0,8),
              child: IconButton(
                onPressed: (){
                  print("Delete button was pressed");
                },
                icon: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
