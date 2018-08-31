import 'package:flutter/widgets.dart';

class ArchSampleKeys {
  static final homeScreen = const Key('__homeScren__');
  static final addTodoFab = const Key('__addTodoFab__');
  static final snackbar = const Key('__snackbar__');

  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  static final todoList = const Key('__todoList__');
  static final todosLoading = const Key('__todosLoading__');
  static final todoItem = (String id) => Key('TodoItem__${id}');
  static final todoItemCheckbox =
      (String id) => Key('TodoItem__${id}__Checkbox');

  static final todoItemTask = (String id) => Key('TodoItem__${id}__Task');
  static final todoItemNote = (String id) => Key('TodoItem__${id}__Note');

  static final tabs = const Key('__tabs__');
  static final todoTab = const Key('__todoTab__');
  static final statsTab = const Key('__statsTab__');

  static final extraActionButton = const Key('__extraActionButton__');
  static final toggleAll = const Key('__markAllDone__');
  static final clearCompleted = const Key('__clearCompleted__');

  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final activeFilter = const Key('__activeFilter__');
  static final completedFilter = const Key('__completedFilter__');

  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumActive = const Key('__statsNumActive__');
  static final statsNumCompleted = const Key('__statsNumCompleted__');

  static final editTodoFab = const Key('__editTodoFab__');
  static final deleteTodoButton = const Key('__deleteTodoButton__');
  static final todoDetailScreen = const Key('__todoDetailScreen__');
  static final detailsTodoItemCheckbox =
      const Key('__detailsTodoItemCheckbox__');
  static final detailsTodoItemTask = const Key('__detailsTodoItemTask__');
  static final detailsTodoItemNote = const Key('__detailsTodoItemNote__');

  static final addTodoScreen = const Key('__addTodoScreen__');
  static final saveNewTodo = const Key('__saveNewTodo__');

  static final editTodoScreen = const Key('__editTodoScreen__');
  static final saveTodoFab = const Key('__saveTodoFab__');
}
