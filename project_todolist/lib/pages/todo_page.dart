import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todolist/cubit/todo_cubit.dart';
import 'package:project_todolist/models/todo.dart';
import 'package:project_todolist/pages/add_todo_page.dart';
// import 'package:project_todolist/pages/edit_todo_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Column(
        children: [
          const Text('List of Todos:'),
          Expanded(
            child: BlocBuilder<TodoCubit, List<Todo>>(
              builder: (context, todos) {
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.name),
                      onTap: () => _showEditDialog(context, index, todo.name),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTodoPage(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showEditDialog(
      BuildContext context, int index, String currentTitle) async {
    TextEditingController _editController =
        TextEditingController(text: currentTitle);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(
            controller: _editController,
            decoration: const InputDecoration(
              labelText: 'Enter new title',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<TodoCubit>()
                    .editTodo(index, _editController.text.trim());
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
