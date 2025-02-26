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

class _TodoListScreenState extends State<TodoListScreen> with SingleTickerProviderStateMixin {
  //late TabController _tabController;
  List<Todo> _todoList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 3, vsync: this);
  // }

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
            //controller: _tabController,
            children: [
              AllTodoListTab(),
              UndoneTodoListTab(),
              DoneTodoListTab(),
            ]),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: 'Add New ToDO',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNewTodoScreen()));
      },
      label: const Text("Add"),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
        //controller: _tabController,
        tabs: [
          const Tab(text: 'All'),
          const Tab(text: 'Undone'),
          const Tab(text: 'Done'),
        ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if(mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index){
    _todoList.removeAt(index);
    if(mounted) {
      setState(() {});
    }
  }
}
