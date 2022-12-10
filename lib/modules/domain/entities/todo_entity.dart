// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoEntity {
  String? id;
  String? title;
  Timestamp? creationDate;
  bool? status;

  TodoEntity({
    this.id,
    this.title,
    this.creationDate,
    this.status,
  });
}
