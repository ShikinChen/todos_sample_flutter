import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/models/models.dart';

class ExtraActionsButton extends StatelessWidget {
  final PopupMenuItemSelected<ExtraAction> onSelected;
  final bool allComplete;

  ExtraActionsButton({
    Key key,
    this.onSelected,
    this.allComplete = false,
  }) : super(key: ArchSampleKeys.extraActionButton);

  @override
  Widget build(BuildContext context) => PopupMenuButton<ExtraAction>(
        onSelected: onSelected,
        itemBuilder: (BuildContext ctx) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                key: ArchSampleKeys.toggleAll,
                value: ExtraAction.toggleAllComplete,
                child: Text(allComplete
                    ? ArchSampleLocalizations.of(ctx).markAllIncomplete
                    : ArchSampleLocalizations.of(ctx).markAllComplete),
              ),
              PopupMenuItem<ExtraAction>(
                key: ArchSampleKeys.clearCompleted,
                value: ExtraAction.clearCompleted,
                child: Text(ArchSampleLocalizations.of(ctx).clearCompleted),
              ),
            ],
      );
}
