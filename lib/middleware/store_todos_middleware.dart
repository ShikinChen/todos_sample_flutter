import 'package:todos/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:todos/repository/todos_repository.dart';
import 'package:todos/repository/todos_repository_flutter.dart';
import 'package:todos/utils/file_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todos/selectors/selectors.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';

List<Middleware<AppState>> createStoreTodosMiddleware([
  TodosRepository repository = const TodosRepositoryFlutter(
      fileStorage:
          const FileStorage('__redux_app__', getApplicationDocumentsDirectory)),
]) {
  final saveTodos = _createSaveTodos(repository);
  final loadTodos = _createLoadTodos(repository);

  return [
    TypedMiddleware<AppState, LoadTodosAction>(loadTodos),
    TypedMiddleware<AppState, AddTodoAction>(saveTodos),
    TypedMiddleware<AppState, ClearCompletedAction>(saveTodos),
    TypedMiddleware<AppState, TodosNotLoadedAction>(saveTodos),
    TypedMiddleware<AppState, UpdateFilterAction>(saveTodos),
    TypedMiddleware<AppState, TodosNotLoadedAction>(saveTodos),
    TypedMiddleware<AppState, DeleteTodoAction>(saveTodos),
  ];
}

Middleware<AppState> _createSaveTodos(TodosRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      next(action);

      repository.saveTodos(
          todosSelector(store.state).map((todo) => todo.toEntity()).toList());
    };

Middleware<AppState> _createLoadTodos(TodosRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      repository
          .loadTodos()
          .then((todos) => store
              .dispatch(TodosLoadedAction(todos.map(Todo.fromEntity).toList())))
          .catchError((_) => store.dispatch(TodosNotLoadedAction()));
    };
