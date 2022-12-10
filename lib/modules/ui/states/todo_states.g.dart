// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_states.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStates on _TodoStatesBase, Store {
  Computed<int?>? _$indexPageComputed;

  @override
  int? get indexPage =>
      (_$indexPageComputed ??= Computed<int?>(() => super.indexPage,
              name: '_TodoStatesBase.indexPage'))
          .value;
  Computed<List<TodoEntity>?>? _$todoListComputed;

  @override
  List<TodoEntity>? get todoList =>
      (_$todoListComputed ??= Computed<List<TodoEntity>?>(() => super.todoList,
              name: '_TodoStatesBase.todoList'))
          .value;
  Computed<String?>? _$todoTitleComputed;

  @override
  String? get todoTitle =>
      (_$todoTitleComputed ??= Computed<String?>(() => super.todoTitle,
              name: '_TodoStatesBase.todoTitle'))
          .value;

  late final _$_indexPageAtom =
      Atom(name: '_TodoStatesBase._indexPage', context: context);

  @override
  int? get _indexPage {
    _$_indexPageAtom.reportRead();
    return super._indexPage;
  }

  @override
  set _indexPage(int? value) {
    _$_indexPageAtom.reportWrite(value, super._indexPage, () {
      super._indexPage = value;
    });
  }

  late final _$pageControllerAtom =
      Atom(name: '_TodoStatesBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$_todoListAtom =
      Atom(name: '_TodoStatesBase._todoList', context: context);

  @override
  List<TodoEntity>? get _todoList {
    _$_todoListAtom.reportRead();
    return super._todoList;
  }

  @override
  set _todoList(List<TodoEntity>? value) {
    _$_todoListAtom.reportWrite(value, super._todoList, () {
      super._todoList = value;
    });
  }

  late final _$formKeyAtom =
      Atom(name: '_TodoStatesBase.formKey', context: context);

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  late final _$_todoTitleAtom =
      Atom(name: '_TodoStatesBase._todoTitle', context: context);

  @override
  String? get _todoTitle {
    _$_todoTitleAtom.reportRead();
    return super._todoTitle;
  }

  @override
  set _todoTitle(String? value) {
    _$_todoTitleAtom.reportWrite(value, super._todoTitle, () {
      super._todoTitle = value;
    });
  }

  late final _$todoControllerAtom =
      Atom(name: '_TodoStatesBase.todoController', context: context);

  @override
  TextEditingController get todoController {
    _$todoControllerAtom.reportRead();
    return super.todoController;
  }

  @override
  set todoController(TextEditingController value) {
    _$todoControllerAtom.reportWrite(value, super.todoController, () {
      super.todoController = value;
    });
  }

  late final _$getTodosAsyncAction =
      AsyncAction('_TodoStatesBase.getTodos', context: context);

  @override
  Future<void> getTodos(BuildContext context) {
    return _$getTodosAsyncAction.run(() => super.getTodos(context));
  }

  late final _$postTodoAsyncAction =
      AsyncAction('_TodoStatesBase.postTodo', context: context);

  @override
  Future<void> postTodo(BuildContext context) {
    return _$postTodoAsyncAction.run(() => super.postTodo(context));
  }

  late final _$_TodoStatesBaseActionController =
      ActionController(name: '_TodoStatesBase', context: context);

  @override
  void setIndexPage(int? value) {
    final _$actionInfo = _$_TodoStatesBaseActionController.startAction(
        name: '_TodoStatesBase.setIndexPage');
    try {
      return super.setIndexPage(value);
    } finally {
      _$_TodoStatesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodoList(List<TodoEntity> value) {
    final _$actionInfo = _$_TodoStatesBaseActionController.startAction(
        name: '_TodoStatesBase.setTodoList');
    try {
      return super.setTodoList(value);
    } finally {
      _$_TodoStatesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodoTitle(String? value) {
    final _$actionInfo = _$_TodoStatesBaseActionController.startAction(
        name: '_TodoStatesBase.setTodoTitle');
    try {
      return super.setTodoTitle(value);
    } finally {
      _$_TodoStatesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void jumpListTodoByIndex(int? value) {
    final _$actionInfo = _$_TodoStatesBaseActionController.startAction(
        name: '_TodoStatesBase.jumpListTodoByIndex');
    try {
      return super.jumpListTodoByIndex(value);
    } finally {
      _$_TodoStatesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
formKey: ${formKey},
todoController: ${todoController},
indexPage: ${indexPage},
todoList: ${todoList},
todoTitle: ${todoTitle}
    ''';
  }
}
