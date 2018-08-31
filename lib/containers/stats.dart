import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/models/models.dart';
import 'package:todos/presentation/stats_counter.dart';
import 'package:todos/selectors/selectors.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (ctx, vm) => StatsCounter(
              numActive: vm.numActive,
              numCompleted: vm.numCompleted,
            ),
      );

  Stats({Key key}) : super(key: key);
}

class _ViewModel {
  final int numCompleted;
  final int numActive;

  _ViewModel({
    @required this.numCompleted,
    @required this.numActive,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
      numActive: numActiveSelector(
        todosSelector(store.state),
      ),
      numCompleted: numCompletedSelector(
        todosSelector(store.state),
      ));
}
