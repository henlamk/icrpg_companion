import 'package:equatable/equatable.dart';
import 'package:icrpg_companion/data/auth_client.dart';
import 'package:icrpg_companion/data/firestore_client.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/user_model.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class UserLoggedInAction extends Equatable {
  final User user;

  UserLoggedInAction({this.user});

  @override
  List<Object> get props => [user];
}

class UserLoggedInFailedAction {}

class UserRegisteredAction extends Equatable {
  final User user;

  UserRegisteredAction({this.user});

  @override
  List<Object> get props => [user];
}

class UserRegisteredFailedAction {}

class UserDataLoadedAction extends Equatable {
  final User user;

  UserDataLoadedAction({this.user});

  @override
  List<Object> get props => [user];
}

class UserDataLoadingFailedAction {
  UserDataLoadingFailedAction();
}

ThunkAction<AppState> login({String email, String password}) {
  return (Store<AppState> store) async {
    User user = await AuthClient.getInstance()
        .loginWithEmail(email: email, password: password);

    if (user.id == null) {
      store.dispatch(UserLoggedInFailedAction());
    } else
      store.dispatch(UserLoggedInAction(user: user));
  };
}

ThunkAction<AppState> register({String email, String password}) {
  return (Store<AppState> store) async {
    User user = await AuthClient.getInstance()
        .signUpWithEmail(email: email, password: password);

    if (user.id == null) {
      store.dispatch(UserLoggedInFailedAction());
    } else
      store.dispatch(UserLoggedInAction(user: user));
  };
}

ThunkAction<AppState> loadUserData() {
  return (Store<AppState> store) async {
    // FirebaseUser user;
    // try {
    //   user = await ApiClient().loadUserData();
    //   if (user != null) {
    //     print((await user.getIdToken()).token);

    //     store.dispatch(
    //       UserDataLoadedAction(
    //         user: store.state.user.copyWith(firebaseUser: user),
    //       ),
    //     );
    //   } else {
    //     store.dispatch(UserDataLoadingFailedAction());
    //   }
    // } catch (e) {
    //   print(e);
    // }
  };
}

// ThunkAction<AppState> signInWithEmailAndPassword(
//     {String email, String password}) {
//   return (Store<AppState> store) async {
//     AuthResult result;
//     try {
//       result = await ApiClient().signInWithEmailAndPassword(email, password);
//       if (result.user != null) {
//         store.dispatch(
//           SignInSuccessAction(
//             user: User(
//               email: email,
//               password: password,
//               firebaseUser: result.user,
//             ),
//           ),
//         );
//       } else {
//         store.dispatch(SignInFailedAction());
//       }
//     } catch (e) {
//       print(e);
//     }
//   };
// }

// ThunkAction<AppState> signOut() {
//   return (Store<AppState> store) async {
//     try {
//       await ApiClient().signOut();
//       store.dispatch(SignOutSuccessAction());
//     } catch (e) {
//       print(e);
//     }
//   };
// }
