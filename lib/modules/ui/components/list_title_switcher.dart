// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/app_dependency.dart';

class ListTitleSwitcher extends StatelessWidget {
  final String title;
  final int pageIndex;

  const ListTitleSwitcher({
    Key? key,
    required this.title,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: ((context) {
          return InkWell(
            onTap: () {
              todoStates.setIndexPage(pageIndex);
              todoStates.jumpListTodoByIndex(pageIndex);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: todoStates.indexPage == pageIndex
                          ? Colors.purple.withOpacity(1)
                          : Colors.purple.withOpacity(.3),
                    ),
                  ),
                  color: todoStates.indexPage == pageIndex
                      ? Colors.purple.withOpacity(.05)
                      : null),
              child: FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: todoStates.indexPage == pageIndex
                        ? Colors.purple.withOpacity(1)
                        : Colors.purple.withOpacity(.3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
