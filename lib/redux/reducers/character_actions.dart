import 'package:icrpg_companion/models/character.dart';
import 'package:icrpg_companion/models/user_model.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:redux/redux.dart';

final CharacterReducer = combineReducers<Character>([
  TypedReducer<Character, CharacterLoadedAction>(_characterLoaded),
  TypedReducer<Character, CharacterCreatedAction>(_characterCreated),
]);

Character _characterCreated(
    Character character, CharacterCreatedAction action) {
  return action.character;
}

Character _characterLoaded(Character character, CharacterLoadedAction action) {
  return action.character;
}
