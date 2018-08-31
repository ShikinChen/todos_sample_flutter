import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/extra_actions_button.dart';
import 'package:todos/selectors/selectors.dart';

class ExtraActionsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => ExtraActionsButton(
              allComplete: vm.allComplete,
              onSelected: vm.onActionSelected,
            ),
      );

  ExtraActionsContainer({Key key}) : super(key: key);
}

class _ViewModel {
  final Function(ExtraAction) onActionSelected;
  final bool allComplete;

  _ViewModel({
    @required this.onActionSelected,
    @required this.allComplete,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
      onActionSelected: (action) {
        if (action == ExtraAction.clearCompleted) {
          store.dispatch(ClearCompletedAction());
        } else {
          store.dispatch(ToggleAllAction());
        }
      },
      allComplete: allCompleteSelector(todosSelector(store.state)));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          allComplete == other.allComplete;

  @override
  int get hashCode => allComplete.hashCode;
}
