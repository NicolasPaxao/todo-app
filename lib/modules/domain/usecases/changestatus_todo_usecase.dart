import 'package:dartz/dartz.dart';

import '../entities/todo_entity.dart';
import '../repositories/itodo_repository.dart';

abstract class IChangeStatusTodoUsecase {
  Future<Either<Exception, bool>> call(TodoEntity todo);
}

class ChangeStatusTodoUsecase implements IChangeStatusTodoUsecase {
  final ITodoRepository repository;

  ChangeStatusTodoUsecase({required this.repository});
  @override
  Future<Either<Exception, bool>> call(TodoEntity todo) async {
    try {
      await repository.changeStatusTodo(todo);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
