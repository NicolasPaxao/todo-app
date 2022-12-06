import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/domain/entities/todo_entity.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';

abstract class IGetTodosUsecase {
  Future<Either<Exception, List<TodoEntity>>> getTodos();
}

class GetTodoUsecase implements IGetTodosUsecase {
  final ITodoRepository repository;

  GetTodoUsecase(this.repository);
  @override
  Future<Either<Exception, List<TodoEntity>>> getTodos() async {
    try {
      final response = await repository.getTodos();
      return Right(response.foldRight([], (r, previous) => r));
    } catch (e) {
      throw Left(e);
    }
  }
}
