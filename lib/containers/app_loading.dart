import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/common/common.dart';
import 'package:todos/selectors/selectors.dart';
import 'package:todos/models/models.dart';

class AppLoading extends StatelessWidget {
  final Function(BuildContext context, bool isLoading) builder;

  AppLoading({@required this.builder, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (Store<AppState> store) => isLoadingSelector(store.state),
        builder: builder,
      );
}
