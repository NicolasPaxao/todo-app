import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo_app/modules/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String? id;
  String? title;
  DateTime? creationDate;
  bool? status;

  TodoModel({
    this.id,
    this.title,
    this.creationDate,
    this.status,
  });

  TodoModel.fromDocument(DocumentSnapshot doc) {
    id = doc['id'] as String;
    title = doc['id'] as String;
    creationDate = doc['id'] as DateTime;
    status = doc['id'] as bool;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'creationDate': creationDate?.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      creationDate: map['creationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int)
          : null,
      status: map['status'] != null ? map['status'] as bool : null,
    );
  }
}
