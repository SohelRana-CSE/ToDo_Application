import 'package:flutter/material.dart';
import 'package:todo_application/entities/todo.dart';
import 'package:todo_application/ui/screens/add_new_todo_screen.dart';
import 'package:todo_application/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_application/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo_application/ui/screens/todo_list/undone_todo_list_tab.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  final List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
            children: [
              AllTodoListTab(
                onDelete: _deleteTodo,
                onStatusChange: _toggleTodoStatus,
                todolist: _todoList,
              ),
              UndoneTodoListTab(
                onDelete: _deleteTodo,
                onStatusChange: _toggleTodoStatus,
                todoList: _todoList.where((item) => item.isDone == false).toList(),
              ),
              DoneTodoListTab(
                onDelete: _deleteTodo,
                onStatusChange: _toggleTodoStatus,
                todoList: _todoList.where((item) => item.isDone == true).toList(),
              ),
            ]),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: 'Add New ToDO',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(
                      onAddTodo: _addNewTodo,
                    )));
      },
      label: const Text("Add"),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
        tabs: [
          const Tab(text: 'All'),
          const Tab(text: 'Undone'),
          const Tab(text: 'Done'),
        ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  //toggleTodoStatus used for done or undone the TodoList
  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
