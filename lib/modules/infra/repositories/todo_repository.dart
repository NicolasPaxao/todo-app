import 'package:todo_app/modules/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';
import 'package:todo_app/modules/infra/datasources/itodo_datasource.dart';

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
}
