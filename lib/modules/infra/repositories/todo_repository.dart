import 'package:dartz/dartz.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/itodo_repository.dart';
import '../datasources/itodo_datasource.dart';
import '../models/todo_model.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource datasource;

  TodoRepository({required this.datasource});
  @override
  Future<Either<Exception, List<TodoEntity>>> getTodos() async {
    try {
      final response = await datasource.getTodos();
      return Right(response.foldRight([], (r, previous) => r));
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> postTodo(TodoEntity todo) async {
    try {
      await datasource.postTodo(TodoModel(
        creationDate: todo.creationDate,
        title: todo.title,
        status: todo.status,
      ));
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteTodo(String uid) async {
    try {
      await datasource.deleteTodo(uid);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> changeStatusTodo(TodoEntity todo) async {
    try {
      await datasource.changeStatusTodo(TodoModel(
        id:  todo.id,
        creationDate: todo.creationDate,
        title: todo.title,
        status: todo.status,
      ));
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
