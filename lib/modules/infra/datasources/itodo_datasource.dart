import 'package:dartz/dartz.dart';

import '../models/todo_model.dart';

abstract class ITodoDatasource {
  Future<Either<Exception, List<TodoModel>>> getTodos();
  Future<Either<Exception, bool>> postTodo(TodoModel todo);
  Future<Either<Exception, bool>> changeStatusTodo(TodoModel todo);
  Future<Either<Exception, bool>> deleteTodo(String uid);
}
