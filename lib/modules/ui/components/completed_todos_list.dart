import 'package:flutter/material.dart';

import '../../../app_dependency.dart';
import '../../domain/entities/todo_entity.dart';
import 'todo_tile.dart';

class TodoListTileCustom extends StatelessWidget {
  const TodoListTileCustom({
    Key? key,
    required this.listIsEmpty,
    required this.todosList,
    required this.emptyMessage,
  }) : super(key: key);

  final bool listIsEmpty;
  final List<TodoEntity> todosList;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (todoStates.loadingList == true) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      );
    } else if (listIsEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: todosList.length,
        itemBuilder: ((context, index) {
          return TodoTile(
            todo: todosList[index],
          );
        }),
      );
    } else {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Montserrat',
          ),
        ),
      );
    }
  }
}
