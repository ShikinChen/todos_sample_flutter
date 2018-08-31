import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/models/models.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todos/presentation/add_edit_screen.dart';
import 'package:todos/actions/actions.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, OnSaveCallback>(
        converter: (Store<AppState> store) => (task, note) {
              store.dispatch(AddTodoAction(Todo(
                task,
                note: note,
              )));
            },
        builder: (BuildContext context, OnSaveCallback onSave) => AddEditScreen(
              key: ArchSampleKeys.addTodoScreen,
              onSave: onSave,
              isEditing: false,
            ),
      );

  AddTodo({Key key}) : super(key: key);
}
