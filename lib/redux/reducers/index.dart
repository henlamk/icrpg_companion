import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/redux/reducers/character_reducers.dart';

import 'user_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      user: userReducer(state.user, action),
      character: characterReducer(state.character, action));
}
