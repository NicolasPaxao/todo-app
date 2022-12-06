import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/domain/entities/todo_entity.dart';

abstract class ITodoRepository {
  Future<Either<Exception, List<TodoEntity>>> getTodos();
  Future<Either<Exception, bool>> postTodo();
  Future<Either<Exception, bool>> putTodo();
  Future<Either<Exception, bool>> deleteTodo();
  Future<Either<Exception, bool>> changeStatusTodo();
}
