import 'package:icrpg_companion/models/user_model.dart';
import 'package:icrpg_companion/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UserLoggedInAction>(_userLoggedIn),
  TypedReducer<User, UserRegisteredAction>(_userRegistered),
  TypedReducer<User, UserDataLoadedAction>(_userDataLoaded),
]);

User _userLoggedIn(User user, UserLoggedInAction action) {
  return action.user;
}

User _userRegistered(User user, UserRegisteredAction action) {
  return action.user;
}

User _userDataLoaded(User user, UserDataLoadedAction action) {
  return action.user;
}
