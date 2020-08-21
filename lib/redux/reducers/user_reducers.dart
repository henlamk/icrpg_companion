import 'package:icrpg_companion/models/user_model.dart';
import 'package:icrpg_companion/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UserDataLoadedAction>(_userDataLoaded),
]);

User _userDataLoaded(User user, UserDataLoadedAction action) {
  return action.user;
}
