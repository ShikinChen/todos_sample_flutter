import 'package:todos/models/models.dart';
import 'package:todos/reducers/loading_reducer.dart';
import 'package:todos/reducers/tabs_reducer.dart';
import 'package:todos/reducers/todos_reducer.dart';
import 'package:todos/reducers/visibility_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      isLoading: loadingReducer(state.isLoading, action),
      todos: todosReducer(state.todos, action),
      activeFilter: visibilityReducer(state.activeFilter, action),
      activeTab: tabsReducer(state.activeTab, action),
    );
