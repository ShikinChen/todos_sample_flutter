import 'package:meta/meta.dart';
import 'package:todos/utils/uuid.dart';
import 'todo_entity.dart';

@immutable
class Todo {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(
    this.task, {
    this.complete = false,
    String id,
    String note = '',
  })  : this.note = note ?? '',
        this.id = id ?? Uuid().generateV4();

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(task ?? this.task,
        complete: complete ?? this.complete,
        id: id ?? this.id,
        note: note ?? this.note);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          id == other.id &&
          note == other.note &&
          task == other.task;

  @override
  int get hashCode =>
      complete.hashCode ^ id.hashCode ^ note.hashCode ^ task.hashCode;

  @override
  String toString() {
    return 'Todo{complete: $complete, id: $id, note: $note, task: $task}';
  }

  TodoEntity toEntity() => TodoEntity(task, id, note, complete);

  static Todo fromEntity(TodoEntity entity) => Todo(entity.task,
      complete: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().generateV4());
}
