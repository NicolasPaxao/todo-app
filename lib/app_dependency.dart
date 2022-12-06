import 'package:get_it/get_it.dart';
import 'package:todo_app/modules/domain/repositories/itodo_repository.dart';
import 'package:todo_app/modules/domain/usecases/get_todo_usecase.dart';
import 'package:todo_app/modules/infra/repositories/todo_repository.dart';
import 'package:todo_app/modules/ui/states/todo_states.dart';

import 'modules/infra/datasources/itodo_datasource.dart';
import 'modules/services/datasources/firebase_todo.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static void init() {
    getIt.registerLazySingleton<FirebaseTodo>(() => FirebaseTodo());

    getIt.registerLazySingleton<ITodoDatasource>(() => FirebaseTodo(),
        instanceName: 'FirebaseTodo');
    getIt.registerLazySingleton<ITodoRepository>(() => getIt<TodoRepository>(),
        instanceName: 'TodoRepository');

    getIt.registerLazySingleton<TodoRepository>(() => TodoRepository(
        datasource:
            getIt.get<ITodoDatasource>(instanceName: 'TodoRepository')));

    getIt.registerLazySingleton<GetTodoUsecase>(
        () => GetTodoUsecase(repository: getIt.get<ITodoRepository>()),
        instanceName: 'TodoRepository');
    getIt.registerSingleton<TodoStates>(TodoStates());
  }
}

final TodoStates todoStates = GetIt.I<TodoStates>();
