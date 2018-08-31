import 'package:flutter/widgets.dart';
import 'package:todos/common/common.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/add_edit_screen.dart';

class EditTodo extends StatelessWidget {
  final Todo todo;

  EditTodo({this.todo, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, OnSaveCallback>(
        converter: (Store<AppState> store) =>
            (task, note) => store.dispatch(UpdateTodoAction(
                todo.id,
                todo.copyWith(
                  task: task,
                  note: note,
                ))),
        builder: (BuildContext context, OnSaveCallback onSave) => AddEditScreen(
              key: ArchSampleKeys.editTodoScreen,
              onSave: onSave,
              isEditing: true,
              todo: todo,
            ),
      );
}
