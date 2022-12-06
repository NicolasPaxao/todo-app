// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoEntity {
  String? id;
  String? title;
  String? description;
  DateTime? creationDate;
  bool? status;

  TodoEntity({
    this.id,
    this.title,
    this.description,
    this.creationDate,
    this.status,
  });
}
