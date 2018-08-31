import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/details_screen.dart';
import 'package:todos/selectors/selectors.dart';

class TodoDetails extends StatelessWidget {
  final String id;

  TodoDetails({@required this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        ignoreChange: (state) => todoSelector(state.todos, id).isNotPresent,
        converter: (Store<AppState> store) => _ViewModel.from(store, id),
        builder: (context, vm) => DetailsScreen(
              todo: vm.todo,
              onDelete: vm.onDelete,
              toggleCompleted: vm.toggleCompleted,
            ),
      );
}

class _ViewModel {
  final Todo todo;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  _ViewModel({
    @required this.todo,
    @required this.onDelete,
    @required this.toggleCompleted,
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final todo = todoSelector(todosSelector(store.state), id).value;

    return _ViewModel(
        todo: todo,
        onDelete: () => store.dispatch(DeleteTodoAction(todo.id)),
        toggleCompleted: (isComplete) {
          store.dispatch(UpdateTodoAction(
            todo.id,
            todo.copyWith(complete: isComplete),
          ));
        });
  }
}
