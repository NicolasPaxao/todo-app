import 'package:todo_app/modules/domain/entities/todo_entity.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';

abstract class IPostTodoUsecase {
  Future<String> postTodo(TodoEntity todo);
}

class PostTodoUsecase implements IPostTodoUsecase {
  final ITodoRepository repository;

  PostTodoUsecase({required this.repository});

  @override
  Future<String> postTodo(TodoEntity todo) async {
    try {
      final response = await repository.postTodo(todo);
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
