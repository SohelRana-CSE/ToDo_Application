import 'package:flutter/material.dart';

import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
        });
  }
}
