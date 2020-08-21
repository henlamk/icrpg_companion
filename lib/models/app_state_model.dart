import 'package:equatable/equatable.dart';
import 'package:icrpg_companion/models/character.dart';

import 'user_model.dart';

class AppState extends Equatable {
  final User user;
  final Character character;

  AppState({this.user, this.character});

  AppState.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        character = json['timer'];

  factory AppState.initial() => AppState(user: User(), character: Character());

  // Map<String, dynamic> toJson() => {
  //       'user': user.toJson(),
  //       'character': character.toJson(),
  //     };

  @override
  String toString() => "$user $character";

  @override
  List<Object> get props => [user, character];

  AppState copyWith({
    User user,
    Character character,
  }) {
    return AppState(
      user: user ?? this.user,
      character: character ?? this.character,
    );
  }
}
