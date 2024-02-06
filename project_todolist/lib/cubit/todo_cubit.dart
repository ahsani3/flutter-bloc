import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_todolist/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void editTodo(int index, String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      return;
    }

    final editedTodo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    final List<Todo> updatedTodos = List.from(state);
    updatedTodos[index] = editedTodo;

    emit(updatedTodos);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
