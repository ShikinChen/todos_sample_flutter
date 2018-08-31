import 'package:todos/models/models.dart';

typedef TodoAdder(Todo todo);

typedef TodoRemover(String id);

typedef TodoUpdater(String id, Todo todo);
