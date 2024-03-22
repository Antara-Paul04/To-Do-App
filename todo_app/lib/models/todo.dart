class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '1', todoText: 'Task 1', isDone: true),
      ToDo(id: '2', todoText: 'Task 2'),
      ToDo(id: '3', todoText: 'Task 3'),
    ];
  }
}
