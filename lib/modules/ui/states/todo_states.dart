// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../app_dependency.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/get_todo_usecase.dart';
import '../../domain/usecases/post_todo_usecase.dart';

part 'todo_states.g.dart';

class TodoStates = _TodoStatesBase with _$TodoStates;

abstract class _TodoStatesBase with Store {
  clear() {
    todoController.clear();
    _todoTitle = '';
  }

  @observable
  int? _indexPage = 0;
  @computed
  int? get indexPage => _indexPage;
  @action
  void setIndexPage(int? value) => _indexPage = value;

  @observable
  PageController pageController = PageController();

  @observable
  List<TodoEntity>? _todoList = [];
  @computed
  List<TodoEntity>? get todoList =>
      _todoList!..sort(((a, b) => a.creationDate!.compareTo(b.creationDate!)));
  @computed
  List<TodoEntity>? get todoListCompleted =>
      _todoList!.where((e) => e.status == true).toList();
  @computed
  List<TodoEntity>? get todoListUncompleted =>
      _todoList!.where((e) => e.status == false).toList();
  @computed
  bool get isTodoListUncompletedNotEmpty => todoListUncompleted!.isNotEmpty;
  @computed
  bool get isTodoListCompledNotEmpty => todoListCompleted!.isNotEmpty;
  @computed
  bool get isTodoListdNotEmpty => todoList!.isNotEmpty;
  @action
  void setTodoList(List<TodoEntity> value) => _todoList = value;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  String? _todoTitle;
  @observable
  TextEditingController todoController = TextEditingController();
  @computed
  String? get todoTitle => _todoTitle;
  @action
  void setTodoTitle(String? value) => _todoTitle = value!.trim();

  @observable
  bool? _loading = false;
  @computed
  bool? get loading => _loading;
  @action
  void setLoading(bool? value) => _loading = value;

  @observable
  bool? _loadingList = false;
  @computed
  bool? get loadingList => _loadingList;
  @action
  void setLoadingList(bool? value) => _loadingList = value;

  @action
  void jumpListTodoByIndex(int? value) {
    pageController.jumpToPage(value!);
  }

  @action
  Future<void> getTodos(BuildContext context) async {
    setLoadingList(true);
    try {
      final result = await getIt<GetTodoUsecase>().getTodos();
      List<TodoEntity> list = result.fold((l) => [], (r) => r);
      setTodoList(list);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ocorreu um erro: ${e.toString()}')));
    }
    setLoadingList(false);
  }

  @action
  Future<void> postTodo(BuildContext context) async {
    setLoading(true);
    try {
      await getIt<PostTodoUsecase>().postTodo(TodoEntity(
        title: todoTitle,
        creationDate: Timestamp.now(),
        status: false,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ocorreu um erro: ${e.toString()}')));
    }
    clear();
    getTodos(context);
    setLoading(false);
  }
}
