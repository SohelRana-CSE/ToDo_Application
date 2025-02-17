import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return TodoItem();
          }),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Title', style: TextStyle(
          decoration: _getTextDecoration(isDone)
        ),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('description'),
            Text('time'),
          ],
        ),
        trailing: _buildRoundedIconButton(),
        /* trailing: OutlinedButton.icon(
             onPressed: () {},
             icon: Icon(Icons.check),
             label: Text('Done')),
         */
      ),
    );
  }

  Widget _buildRoundedIconButton() {
    return CircleAvatar(
      child: Icon(_getIcon(true)),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone){
    return isDone ? TextDecoration.lineThrough : null;
  }
}
