// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) {
  return TodoEntity(json['task'] as String, json['id'] as String,
      json['note'] as String, json['complete'] as bool);
}

Map<String, dynamic> _$TodoEntityToJson(TodoEntity instance) =>
    <String, dynamic>{
      'complete': instance.complete,
      'id': instance.id,
      'note': instance.note,
      'task': instance.task
    };
