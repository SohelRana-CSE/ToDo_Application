import 'package:flutter/material.dart';
import 'package:todo_application/ui/screens/todo_list_screen.dart';

class ToDoApplication extends StatelessWidget {
  const ToDoApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}
