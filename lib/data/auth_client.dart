import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icrpg_companion/data/firestore_client.dart';
import 'package:icrpg_companion/models/user_model.dart';

class AuthClient {
  static AuthClient _instance;

  static AuthClient getInstance() {
    if (_instance == null) _instance = AuthClient();

    return _instance;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User> loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user != null) {
        return await FirestoreClient.getInstance().getUser(authResult.user.uid);
      }

      return User();
    } catch (e) {
      throw e;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    // @required String fullName,
    // @required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      var user = User(
        id: authResult.user.uid,
        email: email,
      );

      await FirestoreClient.getInstance().createUser(user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);

    return user != null;
  }

  Future<User> _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      return await FirestoreClient.getInstance().getUser(user.uid);
    }
  }
}
