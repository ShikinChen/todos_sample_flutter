import 'dart:async';
import 'dart:core';

import 'package:todos/models/todo_entity.dart';
import 'package:todos/repository/todos_repository.dart';
import 'package:todos/utils/file_storage.dart';
import 'package:todos/utils/web_client.dart';
import 'package:meta/meta.dart';

class TodosRepositoryFlutter implements TodosRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const TodosRepositoryFlutter(
      {@required this.fileStorage, this.webClient = const WebClient()});

  @override
  Future<List<TodoEntity>> loadTodos() async {
    try {
      return await fileStorage.loadTodos();
    } catch (e) {
      final todos = await webClient.fetchTodos();
      fileStorage.saveTodos(todos);
      return todos;
    }
  }

  @override
  Future saveTodos(List<TodoEntity> todos) async => Future.wait<dynamic>([
        fileStorage.saveTodos(todos),
        webClient.postTodos(todos),
      ]);
}
