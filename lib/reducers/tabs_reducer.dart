import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';

final tabsReducer = combineReducers<AppTab>(
    [TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer)]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) =>
    action.newTab;
