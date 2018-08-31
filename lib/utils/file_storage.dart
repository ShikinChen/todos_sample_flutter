import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:todos/models/todo_entity.dart';

class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(this.tag, this.getDirectory);

  static const String TODOS_KEY = "todos";

  Future<List<TodoEntity>> loadTodos() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final todos = List<Map<String, dynamic>>(json[TODOS_KEY])
        .map((todoMap) => TodoEntity.fromJson(json))
        .toList();
    return todos;
  }

  Future<File> saveTodos(List<TodoEntity> todos) async {
    final file = await _getLocalFile();

    return file.writeAsString(JsonEncoder().convert({
      TODOS_KEY: todos.map((todo) => todo.toJson()).toList(),
    }));
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();
    return file.delete();
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return File('${dir}/ArchSampleStorage__${tag}.json');
  }
}
