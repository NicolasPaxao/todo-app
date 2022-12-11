import 'package:dartz/dartz.dart';

import '../entities/todo_entity.dart';

abstract class ITodoRepository {
  Future<Either<Exception, List<TodoEntity>>> getTodos();
  Future<Either<Exception, bool>> postTodo(TodoEntity todo);
  Future<Either<Exception, bool>> changeStatusTodo(TodoEntity todo);
  Future<Either<Exception, bool>> deleteTodo(String uid);
}
