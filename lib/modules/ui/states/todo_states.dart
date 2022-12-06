import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/modules/domain/entities/todo_entity.dart';
import 'package:todo_app/modules/domain/usecases/get_todo_usecase.dart';

import '../../../app_dependency.dart';
part 'todo_states.g.dart';

class TodoStates = _TodoStatesBase with _$TodoStates;

abstract class _TodoStatesBase with Store {
  @observable
  int? _indexPage = 0;
  @computed
  int? get indexPage => _indexPage;
  @action
  void setIndexPage(int? value) => _indexPage = value;

  @observable
  PageController pageController = PageController();

  @observable
  List<TodoEntity>? _todoList;
  @computed
  List<TodoEntity>? get todoList => _todoList;
  @action
  void setTodoList(List<TodoEntity> value) => _todoList = value;

  @action
  void jumpListTodoByIndex(int? value) {
    pageController.jumpToPage(value!);
  }

  @action
  Future<void> getCategorias(BuildContext context) async {
    final result = await getIt<GetTodoUsecase>().getTodos();
    if (result.isRight()) {
      List<TodoEntity> list = result.fold((l) => [], (r) => r);
      setTodoList(list);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ocorreu um erro.')));
    }
  }
}
