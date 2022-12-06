import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/domain/entities/todo_entity.dart';

abstract class ITodoRepository {
  Future<Either<Exception, List<TodoEntity>>> getTodos();
}
