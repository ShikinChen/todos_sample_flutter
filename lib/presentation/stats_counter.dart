import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todos/common/common.dart';
import 'package:todos/containers/app_loading.dart';
import 'package:todos/presentation/loading_indicator.dart';

class StatsCounter extends StatelessWidget {
  final int numActive;
  final int numCompleted;

  StatsCounter({
    @required this.numActive,
    @required this.numCompleted,
  });

  @override
  Widget build(BuildContext context) => AppLoading(
        builder: (ctx, loading) => loading
            ? LoadingIndicator(key: Key('__statsLoading__'))
            : _buildStats(ctx),
      );

  Widget _buildStats(BuildContext ctx) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                ArchSampleLocalizations.of(ctx).completedTodos,
                style: Theme.of(ctx).textTheme.title,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: Text(
                '$numCompleted',
                key: ArchSampleKeys.statsNumCompleted,
                style: Theme.of(ctx).textTheme.subhead,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                ArchSampleLocalizations.of(ctx).activeTodos,
                style: Theme.of(ctx).textTheme.title,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: Text(
                '$numActive',
                key: ArchSampleKeys.statsNumCompleted,
                style: Theme.of(ctx).textTheme.subhead,
              ),
            ),
          ],
        ),
      );
}
