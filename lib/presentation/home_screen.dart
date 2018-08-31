import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:todos/containers/active_tab.dart';
import 'package:todos/containers/extra_actions_container.dart';
import 'package:todos/containers/filter_selector.dart';
import 'package:todos/containers/filtered_todos.dart';
import 'package:todos/containers/stats.dart';
import 'package:todos/models/models.dart';
import 'package:todos/containers/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ActiveTab(
        builder: (BuildContext ctx, AppTab activeTab) => Scaffold(
              appBar: AppBar(
                title: Text(ArchSampleLocalizations.of(ctx).appTitle),
                actions: <Widget>[
                  FilterSelector(visible: activeTab == AppTab.todos),
                  ExtraActionsContainer(),
                ],
              ),
              body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
              floatingActionButton: FloatingActionButton(
                key: ArchSampleKeys.addTodoFab,
                onPressed: () {
                  Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
                },
                child: Icon(Icons.add),
                tooltip: ArchSampleLocalizations.of(context).addTodo,
              ),
              bottomNavigationBar: TabSelector(),
            ),
      );

  HomeScreen() : super(key: ArchSampleKeys.homeScreen);
}
