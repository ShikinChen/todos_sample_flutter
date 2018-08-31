import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/filter_button.dart';

class FilterSelector extends StatelessWidget {
  final bool visible;

  FilterSelector({
    @required this.visible,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => FilterButton(
              visible: visible,
              activeFilter: vm.activeFilter,
              onSelected: vm.onFilterSelected,
            ),
      );
}

class _ViewModel {
  final Function(VisibilityFilter) onFilterSelected;
  final VisibilityFilter activeFilter;

  _ViewModel({
    @required this.onFilterSelected,
    @required this.activeFilter,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
      activeFilter: store.state.activeFilter,
      onFilterSelected: (filter) {
        store.dispatch(UpdateFilterAction(filter));
      });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeFilter == other.activeFilter;

  @override
  int get hashCode => activeFilter.hashCode;
}
