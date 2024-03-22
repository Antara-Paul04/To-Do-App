import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(20,5,10,5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Color(0xFFD1C1F2),
        leading: Icon(Icons.check_box, color:Color.fromARGB(255, 99, 62, 154),), // Icon before the text
        title: Row(
          children: [
            Text(
              'Task Title', // Your text here
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 18, // Text size 
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(170, 8,0,8),
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
