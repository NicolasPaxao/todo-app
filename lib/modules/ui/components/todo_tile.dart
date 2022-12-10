import 'package:flutter/material.dart';

import '../../../utils/dialogs.dart';
import '../../domain/entities/todo_entity.dart';

class TodoTile extends StatelessWidget {
  TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final TodoEntity todo;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    var isTodoFalse = todo.status == false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 50,
        color: isTodoFalse
            ? Colors.purple.withOpacity(0.1)
            : Colors.green.withOpacity(0.1),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: ((context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          width: 300,
                          height: 220,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Título',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Expanded(
                                    child: Text(
                                      todo.title ?? 'Sem titulo',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
                child: Text(
                  todo.title ?? 'Sem titulo',
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Visibility(
              visible: isTodoFalse,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    splashRadius: 26,
                    onPressed: () => DialogsApp.confirmDialog(
                        context: context,
                        titleModal: 'Deseja excluir este item?',
                        buttonMainAcion: 'Excluir',
                        mainFunction: () {}),
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
            Visibility(
              visible: !isTodoFalse,
              child: IconButton(
                splashRadius: 26,
                onPressed: () => DialogsApp.confirmDialog(
                    context: context,
                    titleModal: 'Deseja re-ativar este item?',
                    buttonMainAcion: 'Re-ativar',
                    mainFunction: () {}),
                icon: const Icon(
                  Icons.redo,
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
