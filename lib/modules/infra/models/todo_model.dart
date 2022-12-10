import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String? id;
  String? title;
  Timestamp? creationDate;
  bool? status;

  TodoModel({
    this.id,
    this.title,
    this.creationDate,
    this.status,
  });

  TodoModel.fromDocument(DocumentSnapshot doc) {
    id = doc['id'] as String;
    title = doc['title'] as String;
    creationDate = doc['creationDate'] as Timestamp;
    status = doc['status'] as bool;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'creationDate': creationDate,
      'status': status,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      creationDate: map['creationDate'] != null
          ? map['creationDate'] as Timestamp
          : null,
      status: map['status'] != null ? map['status'] as bool : null,
    );
  }
}
