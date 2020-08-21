import 'package:equatable/equatable.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/character.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class CharacterCreatedAction extends Equatable {
  final Character character;

  CharacterCreatedAction({this.character});

  @override
  List<Object> get props => [character];
}

class CharacterCreatedFailedAction {}

class CharacterLoadedAction extends Equatable {
  final Character character;

  CharacterLoadedAction({this.character});

  @override
  List<Object> get props => [character];
}

class CharacterLoadedFailedAction {}

ThunkAction<AppState> createCharacter() {
  return (Store<AppState> store) async {};
}

ThunkAction<AppState> loadCharacter() {
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
