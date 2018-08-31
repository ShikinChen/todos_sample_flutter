import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todos/common/common.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';

class TabSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (ctx, vm) => BottomNavigationBar(
              key: ArchSampleKeys.tabs,
              currentIndex: AppTab.values.indexOf(vm.activeTab),
              onTap: vm.onTabSelected,
              items: AppTab.values
                  .map((tab) => BottomNavigationBarItem(
                        icon: Icon(
                          tab == AppTab.todos ? Icons.list : Icons.show_chart,
                          key: tab == AppTab.todos
                              ? ArchSampleKeys.todoTab
                              : ArchSampleKeys.statsTab,
                        ),
                        title: Text(tab == AppTab.stats
                            ? ArchSampleLocalizations.of(context).stats
                            : ArchSampleLocalizations.of(context).todos),
                      ))
                  .toList(),
            ),
      );

  TabSelector({Key key}) : super(key: key);
}

class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        activeTab: store.state.activeTab,
        onTabSelected: (index) {
          store.dispatch(UpdateTabAction(AppTab.values[index]));
        },
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;
}