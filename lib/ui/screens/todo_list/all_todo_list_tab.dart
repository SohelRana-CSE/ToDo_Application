import 'package:flutter/material.dart';
import 'package:todo_application/ui/widgets/empty_list_widget.dart';

import '../../../entities/todo.dart';
import '../../widgets/todo_item.dart';

class AllTodoListTab extends StatelessWidget {
  const AllTodoListTab(
      {super.key,
      required this.todolist,
      required this.onDelete,
      required this.onStatusChange});

  final List<Todo> todolist;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  @override
  Widget build(BuildContext context) {
    if (todolist.isEmpty){
      return const EmptyListWidget();
    }
    return ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_){
              onDelete(index);
            },
            // confirmDismiss: (_){},
            child: TodoItem(
              todo: todolist[index],
              onIconButtonPressed: () {
                onStatusChange(index);
              },
            ),
          );
        });
  }
}
