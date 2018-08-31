import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';

final visibilityReducer = combineReducers<VisibilityFilter>([
  TypedReducer<VisibilityFilter, UpdateFilterAction>(_activeFilterReducer),
]);

VisibilityFilter _activeFilterReducer(
        VisibilityFilter activeFilter, UpdateFilterAction action) =>
    action.newFilter;
