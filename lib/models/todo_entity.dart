import 'package:json_annotation/json_annotation.dart';

part 'todo_entity.g.dart';

@JsonSerializable()
class TodoEntity {
  final bool complete;
  final String id;
  final String note;
  final String task;

  TodoEntity(this.task, this.id, this.note, this.complete);

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);
}
