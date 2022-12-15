// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/model/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  final List<Todo> intialTodos;

  FilteredTodoCubit({
    required this.intialTodos,
  }) : super(FilteredTodoState(fillteredTodos: intialTodos));

  void setFillteredTodo(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> fillteredTodo = [];

    switch (filter) {
      case Filter.active:
        fillteredTodo = todos.where((Todo t) => !t.completed).toList();
        break;
      case Filter.completed:
        fillteredTodo = todos.where((Todo t) => t.completed).toList();
        break;
      case Filter.all:
      default:
        fillteredTodo = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      fillteredTodo = todos
          .where((Todo t) =>
              t.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(fillteredTodos: fillteredTodo));
  }
}
