import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/selectors/selectors.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, DeleteTodoAction>(_deleteTodo),
  TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
  TypedReducer<List<Todo>, ClearCompletedAction>(_cleanCompleted),
  TypedReducer<List<Todo>, ToggleAllAction>(_toggleAll),
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
]);

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) =>
    List.from(todos)..add(action.todo);

List<Todo> _deleteTodo(List<Todo> todos, DeleteTodoAction action) =>
    todos.where((todo) => todo.id != action.id).toList();

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action) => todos
    .map((todo) => todo.id == action.id ? action.updatedTodo : todo)
    .toList();

List<Todo> _cleanCompleted(List<Todo> todos, ClearCompletedAction action) =>
    todos.where((todo) => !todo.complete).toList();

List<Todo> _toggleAll(List<Todo> todos, ToggleAllAction action) => todos
    .map((todo) => todo.copyWith(complete: !allCompleteSelector(todos)))
    .toList();

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action) =>
    action.todos;

List<Todo> _setNoTodos(List<Todo> todos, TodosNotLoadedAction action) => [];
