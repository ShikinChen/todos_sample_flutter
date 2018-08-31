import 'dart:async';

import 'package:todos/repository/todos_repository.dart';
import 'package:todos/models/todo_entity.dart';

class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  Future<List<TodoEntity>> fetchTodos() async => Future.delayed(
      delay,
      () => [
            TodoEntity(
              'Buy food for da kitty',
              '1',
              'With the chickeny bits!',
              false,
            ),
            TodoEntity(
              'Find a Red Sea dive trip',
              '2',
              'Echo vs MY Dream',
              false,
            ),
            TodoEntity(
              'Book flights to Egypt',
              '3',
              '',
              true,
            ),
            TodoEntity(
              'Decide on accommodation',
              '4',
              '',
              false,
            ),
            TodoEntity(
              'Sip Margaritas',
              '5',
              'on the beach',
              true,
            ),
          ]);

  Future<bool> postTodos(List<TodoEntity> todos) async => Future.value(true);
}
