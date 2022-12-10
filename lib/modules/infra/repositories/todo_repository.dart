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
  Future<String> postTodo(TodoEntity todo) async {
    try {
      final response = await datasource.postTodo(TodoModel(
        
        creationDate: todo.creationDate,
        title: todo.title,
        status: todo.status,
      ));
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
