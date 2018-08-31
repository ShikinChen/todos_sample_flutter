import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/containers/app_loading.dart';
import 'package:todos/containers/todo_details.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/todo_item.dart';
import 'package:todos/presentation/loading_indicator.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo, bool) onCheckboxChanged;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;

  TodoList({
    Key key,
    @required this.todos,
    @required this.onCheckboxChanged,
    @required this.onRemove,
    @required this.onUndoRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppLoading(
        builder: (ctx, loading) => loading
            ? LoadingIndicator(
                key: ArchSampleKeys.todosLoading,
              )
            : _buildListView(),
      );

  ListView _buildListView() => ListView.builder(
        key: ArchSampleKeys.todoList,
        itemCount: todos.length,
        itemBuilder: (BuildContext ctx, int index) => TodoItem(
              todo: todos[index],
              onDismissed: (direction) {
                _removeTodo(ctx, todos[index]);
              },
              onTap: () => _onTodoTap(ctx, todos[index]),
              onCheckboxChange: (complete) {
                onCheckboxChanged(todos[index], complete);
              },
            ),
      );

  void _removeTodo(BuildContext ctx, Todo todo) {
    onRemove(todo);
    Scaffold.of(ctx).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(ctx).backgroundColor,
      content: Text(
        ArchSampleLocalizations.of(ctx).todoDeleted(todo.task),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      action: SnackBarAction(
        label: ArchSampleLocalizations.of(ctx).undo,
        onPressed: () => onUndoRemove(todo),
      ),
    ));
  }

  void _onTodoTap(BuildContext ctx, Todo todo) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(
      builder: (_) => TodoDetails(
            id: todo.id,
          ),
    ))
        .then((removeTodo) {
      if (removeTodo != null) {
        Scaffold.of(ctx).showSnackBar(SnackBar(
          key: ArchSampleKeys.snackbar,
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(ctx).backgroundColor,
          content: Text(
            ArchSampleLocalizations.of(ctx).todoDeleted(todo.task),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          action: SnackBarAction(
            label: ArchSampleLocalizations.of(ctx).undo,
            onPressed: () {
              onUndoRemove(todo);
            },
          ),
        ));
      }
    });
  }
}
