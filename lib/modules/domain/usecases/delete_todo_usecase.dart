import 'package:dartz/dartz.dart';

import '../repositories/itodo_repository.dart';

abstract class IDeleteTodoUsecase {
  Future<Either<Exception, bool>> call(String uid);
}

class DeleteTodoUsecase implements IDeleteTodoUsecase {
  final ITodoRepository repository;

  DeleteTodoUsecase({required this.repository});
  @override
  Future<Either<Exception, bool>> call(String uid) async {
    try {
      await repository.deleteTodo(uid);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
