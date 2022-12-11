import 'package:dartz/dartz.dart';

import '../entities/todo_entity.dart';
import '../repositories/itodo_repository.dart';

abstract class IGetTodosUsecase {
  Future<Either<Exception, List<TodoEntity>>> call();
}

class GetTodoUsecase implements IGetTodosUsecase {
  final ITodoRepository repository;

  GetTodoUsecase({required this.repository});
  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    try {
      final response = await repository.getTodos();
      return Right(response.foldRight([], (r, previous) => r));
    } catch (e) {
      throw Left(e);
    }
  }
}
