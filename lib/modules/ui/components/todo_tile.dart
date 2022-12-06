import 'package:flutter/material.dart';
import 'package:todo_app/modules/domain/entities/todo_entity.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        color: Colors.purple.withOpacity(0.1),
        child: Row(
          children: [
            const SizedBox(width: 10),
            FittedBox(
                child: Text(
              todo.title ?? 'Sem titulo',
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
            )),
            const Spacer(),
            IconButton(
              splashRadius: 26,
              onPressed: () {},
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.purple,
              ),
            ),
            Container(width: 1, height: 20, color: Colors.purple),
            IconButton(
              splashRadius: 26,
              onPressed: () {},
              icon: const Icon(
                Icons.done_rounded,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
