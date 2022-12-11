import 'package:get_it/get_it.dart';

import 'modules/domain/repositories/itodo_repository.dart';
import 'modules/domain/usecases/changestatus_todo_usecase.dart';
import 'modules/domain/usecases/delete_todo_usecase.dart';
import 'modules/domain/usecases/get_todo_usecase.dart';
import 'modules/domain/usecases/post_todo_usecase.dart';
import 'modules/infra/datasources/itodo_datasource.dart';
import 'modules/infra/repositories/todo_repository.dart';
import 'modules/services/datasources/firebase_todo.dart';
import 'modules/ui/states/todo_states.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static void init() {
    //* DATASOURCE
    getIt.registerLazySingleton<FirebaseTodo>(() => FirebaseTodo());

    //* INTERFACE
    getIt.registerLazySingleton<ITodoDatasource>(() => FirebaseTodo(),
        instanceName: 'FirebaseTodo');
    getIt.registerLazySingleton<ITodoRepository>(() => getIt<TodoRepository>(),
        instanceName: 'TodoRepository');

    //* IMPLEMTAÇÕES
    getIt.registerLazySingleton<TodoRepository>(() => TodoRepository(
        datasource: getIt.get<ITodoDatasource>(instanceName: 'FirebaseTodo')));

    //* USECASES
    getIt.registerLazySingleton<GetTodoUsecase>(
      () => GetTodoUsecase(
          repository:
              getIt.get<ITodoRepository>(instanceName: 'TodoRepository')),
    );
    getIt.registerLazySingleton<PostTodoUsecase>(() => PostTodoUsecase(
        repository:
            getIt.get<ITodoRepository>(instanceName: 'TodoRepository')));

    getIt.registerLazySingleton<ChangeStatusTodoUsecase>(() =>
        ChangeStatusTodoUsecase(
            repository:
                getIt.get<ITodoRepository>(instanceName: 'TodoRepository')));
    getIt.registerLazySingleton<DeleteTodoUsecase>(() => DeleteTodoUsecase(
        repository:
            getIt.get<ITodoRepository>(instanceName: 'TodoRepository')));

    getIt.registerSingleton<TodoStates>(TodoStates());
  }
}

final TodoStates todoStates = GetIt.I<TodoStates>();
final GetTodoUsecase getTodoUsecase = GetIt.I<GetTodoUsecase>();
final PostTodoUsecase postTodoUsecase = GetIt.I<PostTodoUsecase>();
final ChangeStatusTodoUsecase changeStatusTodoUsecase =
    GetIt.I<ChangeStatusTodoUsecase>();
final DeleteTodoUsecase deleteTodoUsecase = GetIt.I<DeleteTodoUsecase>();
