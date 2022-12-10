// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/app_dependency.dart';
import 'package:todo_app/modules/ui/components/textfield_custom.dart';

import '../components/list_title_switcher.dart';
import '../components/submit_button.dart';
import '../components/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    todoStates.getTodos(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FittedBox(
                      child: Text(
                        'Dezembro',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: Text(
                        'dia ${DateTime.now().day}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const FittedBox(
                  child: Text(
                    'Lista de\nTo-Dos',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                    textAlign: TextAlign.end,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            const Divider(thickness: 1, height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Flexible(child: TextFieldCustom()),
                SizedBox(width: 10),
                SizedBox(
                  height: 48,
                  width: 50,
                  child: SubmitButton(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                ListTitleSwitcher(pageIndex: 0, title: 'Todos'),
                ListTitleSwitcher(pageIndex: 1, title: 'Completo'),
                ListTitleSwitcher(pageIndex: 2, title: 'Incompleto'),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.purple, width: 3),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: PageView(
                controller: todoStates.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Observer(builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: todoStates.todoList!.length,
                      itemBuilder: ((context, index) {
                        return TodoTile(
                          todo: todoStates.todoList![index],
                        );
                      }),
                    );
                  }),
                  Observer(builder: (_) {
                    return todoStates.isTodoListCompledNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: todoStates.todoListCompleted!.length,
                            itemBuilder: ((context, index) {
                              return TodoTile(
                                todo: todoStates.todoListCompleted![index],
                              );
                            }),
                          )
                        : const Center(
                            child: Text('Sem itens completos'),
                          );
                  }),
                  Observer(builder: (_) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: todoStates.todoListUncompleted!.length,
                      itemBuilder: ((context, index) {
                        todoStates.todoList!;
                        return TodoTile(
                          todo: todoStates.todoListUncompleted![index],
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: ((context) {
                if (todoStates.isTodoListUncompletedNotEmpty) {
                  return FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                          children: [
                            const TextSpan(
                              text: 'Você tem ',
                            ),
                            TextSpan(
                              text:
                                  '${todoStates.todoListUncompleted!.length} ${todoStates.todoListUncompleted!.length > 1 ? 'itens' : 'item'}',
                              style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${todoStates.todoListUncompleted!.length > 1 ? 'pendentes' : 'pendente'} à fazer!',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Text(
                    'Não possui itens pendentes!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
