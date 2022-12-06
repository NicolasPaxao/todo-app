import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/infra/datasources/itodo_datasource.dart';
import 'package:todo_app/modules/infra/models/todo_model.dart';

class FirebaseTodo implements ITodoDatasource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Either<Exception, List<TodoModel>>> getTodos() async {
    try {
      final response = await db.collection('collectionPath').get();
      var list = response.docs.map((e) => TodoModel.fromDocument(e)).toList();
      return Right(list);
    } catch (e) {
      return left(Exception(e));
    }
  }
}
