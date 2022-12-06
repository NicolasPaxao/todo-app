import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/infra/models/todo_model.dart';

abstract class ITodoDatasource {
  Future<Either<Exception, List<TodoModel>>> getTodos();
}
