import 'package:get_it/get_it.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';
import 'package:todo_app/modules/domain/usecases/get_todo_usecase.dart';
import 'package:todo_app/modules/domain/usecases/post_todo_usecase.dart';
import 'package:todo_app/modules/infra/repositories/todo_repository.dart';
import 'package:todo_app/modules/ui/states/todo_states.dart';

import 'modules/infra/datasources/itodo_datasource.dart';
import 'modules/services/datasources/firebase_todo.dart';

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

    getIt.registerSingleton<TodoStates>(TodoStates());
  }
}

final TodoStates todoStates = GetIt.I<TodoStates>();
