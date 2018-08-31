import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todos/common/common.dart';
import 'package:todos/models/models.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChange;
  final Todo todo;

  TodoItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChange,
    @required this.todo,
  });

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ArchSampleKeys.todoItem(todo.id),
        onDismissed: onDismissed,
        child: ListTile(
          onTap: onTap,
          leading: Checkbox(
            value: todo.complete,
            onChanged: onCheckboxChange,
            key: ArchSampleKeys.todoItemCheckbox(todo.id),
          ),
          title: Hero(
            tag: '${todo.id}__heroTag',
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                todo.task,
                key: ArchSampleKeys.todoItemTask(todo.id),
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          subtitle: Text(
            todo.note,
            key: ArchSampleKeys.todoItemNote(todo.id),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
      );
}
