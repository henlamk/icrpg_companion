import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class LoggingMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);

    if (action is! DevToolsAction) {
      print('Action: $action');
    }
  }
}
