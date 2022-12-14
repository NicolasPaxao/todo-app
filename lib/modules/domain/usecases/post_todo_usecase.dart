import 'package:dartz/dartz.dart';

import '../entities/todo_entity.dart';
import '../repositories/itodo_repository.dart';

abstract class IPostTodoUsecase {
  Future<Either<Exception, bool>> call(TodoEntity todo);
}

class PostTodoUsecase implements IPostTodoUsecase {
  final ITodoRepository repository;

  PostTodoUsecase({required this.repository});

  @override
  Future<Either<Exception, bool>> call(TodoEntity todo) async {
    try {
      await repository.postTodo(todo);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
