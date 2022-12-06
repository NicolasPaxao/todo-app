import 'package:todo_app/modules/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';

class TodoRepository implements ITodoRepository{
  @override
  Future<Either<Exception, bool>> changeStatusTodo() {
    // TODO: implement changeStatusTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> deleteTodo() {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<TodoEntity>>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> postTodo() {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> putTodo() {
    // TODO: implement putTodo
    throw UnimplementedError();
  }

}