import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/models/models.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _taskKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _noteKey =
      GlobalKey<FormFieldState<String>>();

  final bool isEditing;
  final Function(String, String) onSave;
  final Todo todo;

  AddEditScreen(
      {Key key, @required this.isEditing, @required this.onSave, this.todo})
      : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  Widget build(BuildContext context) {
    final localizatins = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? localizatins.editTodo : localizatins.addTodo,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  initialValue: isEditing ? todo.task : '',
                  key: _taskKey,
                  autofocus: !isEditing,
                  style: textTheme.headline,
                  decoration: InputDecoration(
                    hintText: localizatins.newTodoHint,
                  ),
                  validator: (val) =>
                      val.trim().isEmpty ? localizatins.emptyTodoError : null,
                ),
                TextFormField(
                  initialValue: isEditing ? todo.note : '',
                  key: _noteKey,
                  maxLines: 10,
                  style: textTheme.subhead,
                  decoration: InputDecoration(
                    hintText: localizatins.notesHint,
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            onSave(
              _taskKey.currentState.value,
              _noteKey.currentState.value,
            );
            Navigator.pop(context);
          }
        },
        tooltip: isEditing ? localizatins.saveChanges : localizatins.addTodo,
        child: Icon(isEditing ? Icons.check : Icons.add),
      ),
    );
  }
}
