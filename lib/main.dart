import 'package:flutter/material.dart';
import 'package:todos/common/common.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todos/actions/actions.dart';
import 'package:todos/containers/add_todo.dart';
import 'package:todos/presentation/home_screen.dart';
import 'package:todos/reducers/app_state_reducer.dart';
import 'package:todos/middleware/store_todos_middleware.dart';
import 'package:todos/models/models.dart';

void main() {
//  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(ReduxApp());
}

class ReduxApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreTodosMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: '',
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
        ],
        routes: {
          ArchSampleRoutes.home: (context) => StoreBuilder<AppState>(
                onInit: (store) => store.dispatch(LoadTodosAction()),
                builder: (ctx, store) => HomeScreen(),
              ),
          ArchSampleRoutes.addTodo: (ctx) => AddTodo(),
        },
      ),
    );
  }
}
