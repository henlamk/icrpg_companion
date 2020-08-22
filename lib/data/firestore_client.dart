import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:icrpg_companion/models/character.dart';
import 'package:icrpg_companion/models/user_model.dart';

class FirestoreClient {
  static FirestoreClient _client;

  static FirestoreClient getInstance() {
    if (_client == null) _client = FirestoreClient();

    return _client;
  }

  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _charactersCollectionReference =
      Firestore.instance.collection('characters');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromJson(userData.data);
    } catch (e) {
      print(e.toString());

      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  createCharacter(Character character) async {
    try {
      // character.userId = userId;
      await _charactersCollectionReference.add(character.toJson());
    } catch (e) {
      if (e is PlatformException) {
        print(e.message);
        return e.message;
      }

      return e.toString();
    }
  }

  updateCharacter(Character character) async {
    try {
      // character.userId = userId;
      await _charactersCollectionReference
          .document(character.documentId)
          .updateData(character.toJson());
    } catch (e) {
      if (e is PlatformException) {
        print(e.message);
        return e.message;
      }

      return e.toString();
    }
  }
}
