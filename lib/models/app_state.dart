import 'package:todos/models/models.dart';
import 'package:meta/meta.dart';
import 'todo.dart';
import 'app_tab.dart';
import 'visibility_filter.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Todo> todos;
  final AppTab activeTab;
  final VisibilityFilter activeFilter;

  AppState(
      {this.isLoading = false,
      this.todos = const [],
      this.activeTab = AppTab.todos,
      this.activeFilter = VisibilityFilter.all});

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Todo> todos,
    AppTab activeTab,
    VisibilityFilter activeFilter,
  }) =>
      AppState(
        isLoading: isLoading ?? this.isLoading,
        activeFilter: activeFilter ?? this.activeFilter,
        activeTab: activeTab ?? this.activeFilter,
        todos: todos ?? this.todos,
      );

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, todos: $todos, activeTab: $activeTab, activeFilter: $activeFilter}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              todos == other.todos &&
              activeTab == other.activeTab &&
              activeFilter == other.activeFilter;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      todos.hashCode ^
      activeTab.hashCode ^
      activeFilter.hashCode;



}
