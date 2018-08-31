import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/models/models.dart';

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<AppTab> builder;

  ActiveTab({@required this.builder, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, AppTab>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.activeTab,
        builder: builder,
      );
}
