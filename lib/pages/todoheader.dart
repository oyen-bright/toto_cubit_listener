import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubits.dart';
import '../model/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text.rich(TextSpan(
            text: "Todo",
            children: <InlineSpan>[
              TextSpan(text: "Listiner", style: TextStyle(fontSize: 10))
            ],
            style: TextStyle(fontSize: 40))),
        BlocListener<TodoListCubit, TodoListState>(listener: (context, state) {
          final count = state.todos.where((Todo t) => !t.completed).length;
          context.read<ActiveTodoCountCubit>().calculateActiveTodos(count);
        }, child: BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
          builder: (context, state) {
            return Text("${state.activeTodoCount} items Left",
                style: const TextStyle(fontSize: 20, color: Colors.redAccent));
          },
        ))
      ],
    );
  }
}
