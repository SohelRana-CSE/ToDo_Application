import 'package:flutter/material.dart';
import 'package:todo_application/entities/todo.dart';
import 'package:todo_application/ui/screens/add_new_todo_screen.dart';
import 'package:todo_application/ui/widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              // onDismissed: (_){},
              // confirmDismiss: (_){},
              child: TodoItem(
                todo: Todo(
                    'title will be here', 'description isag', DateTime.now()),
                onIconButtonPressed: () {},
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Add New ToDO',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewTodoScreen()));
        },
        label: const Text("Add"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
