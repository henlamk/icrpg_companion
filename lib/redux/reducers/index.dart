import 'package:icrpg_companion/models/app_state_model.dart';

import 'user_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducer(state.user, action),
  );
}
