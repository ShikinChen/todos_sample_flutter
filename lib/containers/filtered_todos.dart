import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/todo_list.dart';
import 'package:todos/selectors/selectors.dart';

class FilteredTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (ctx, vm) => TodoList(
              todos: vm.todos,
              onCheckboxChanged: vm.onCheckboxChanged,
              onRemove: vm.onRemove,
              onUndoRemove: vm.onUndoRemove,
            ),
      );

  FilteredTodos({Key key}) : super(key: key);
}

class _ViewModel {
  final List<Todo> todos;
  final bool loading;
  final Function(Todo, bool) onCheckboxChanged;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;

  _ViewModel({
    @required this.todos,
    @required this.loading,
    @required this.onCheckboxChanged,
    @required this.onRemove,
    @required this.onUndoRemove,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        todos: filteredTodosSelector(
          todosSelector(store.state),
          activeFilterSelector(store.state),
        ),
        loading: store.state.isLoading,
        onCheckboxChanged: (todo, complete) {
          store.dispatch(UpdateTodoAction(
            todo.id,
            todo.copyWith(complete: !todo.complete),
          ));
        },
        onRemove: (todo) {
          store.dispatch(DeleteTodoAction(todo.id));
        },
        onUndoRemove: (todo) {
          store.dispatch(AddTodoAction(todo));
        },
      );
}
