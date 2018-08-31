import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/containers/edit_todo.dart';
import 'package:todos/models/models.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  DetailsScreen({
    Key key,
    this.todo,
    this.onDelete,
    this.toggleCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.todoDetails),
        actions: <Widget>[
          IconButton(
            tooltip: localizations.deleteTodo,
            key: ArchSampleKeys.deleteTodoButton,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete();
              Navigator.pop(context, todo);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Checkbox(
                    value: todo.complete,
                    onChanged: toggleCompleted,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: '${todo.id}__heroTag',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Text(
                            todo.task,
                            key: ArchSampleKeys.detailsTodoItemTask,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                      Text(
                        todo.note,
                        key: ArchSampleKeys.detailsTodoItemNote,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: ArchSampleKeys.editTodoFab,
        tooltip: localizations.editTodo,
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditTodo(
                    todo: todo,
                  )));
        },
      ),
    );
  }
}
