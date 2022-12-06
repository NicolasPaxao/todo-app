// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo_app/modules/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String? id;
  String? title;
  String? description;
  DateTime? creationDate;
  bool? status;

  TodoModel({
    this.id,
    this.title,
    this.description,
    this.creationDate,
    this.status,
  });

  TodoModel.fromDocument(DocumentSnapshot doc) {
    id = doc['id'] as String;
    title = doc['id'] as String;
    description = doc['id'] as String;
    creationDate = doc['id'] as DateTime;
    status = doc['id'] as bool;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'creationDate': creationDate?.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      creationDate: map['creationDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int) : null,
      status: map['status'] != null ? map['status'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
