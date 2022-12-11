import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../infra/datasources/itodo_datasource.dart';
import '../../infra/models/todo_model.dart';

class FirebaseTodo implements ITodoDatasource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Either<Exception, List<TodoModel>>> getTodos() async {
    try {
      final response =
          await db.collection('todos').orderBy('creationDate').get();
      var list = response.docs.map((e) => TodoModel.fromDocument(e)).toList();
      return Right(list);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> postTodo(TodoModel todo) async {
    try {
      var docRef = await db.collection('todos').add(todo.toJson());
      todo.id = docRef.id;
      await db.collection('todos').doc(docRef.id).update(todo.toJson());
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> changeStatusTodo(TodoModel todo) async {
    try {
      await db.collection('todos').doc(todo.id).update(todo.toJson());
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteTodo(String uid) async {
    try {
      await db.collection('todos').doc(uid).delete();
      return const Right(true);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
