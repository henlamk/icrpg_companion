import 'package:icrpg_companion/models/character.dart';
import 'package:icrpg_companion/models/user_model.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:redux/redux.dart';

final characterReducer = combineReducers<Character>([
  TypedReducer<Character, CharacterLoadedAction>(_characterLoaded),
  TypedReducer<Character, CharacterCreatedAction>(_characterCreated),
  TypedReducer<Character, CharacterWorldSelectedAction>(
      _characterWorldSelected),
  TypedReducer<Character, CharacterGuildSelectedAction>(
      _characterGuildSelected),
  TypedReducer<Character, CharacterFolkSelectedAction>(_characterFolkSelected),
  TypedReducer<Character, CharacterNameSelectedAction>(_characterNameSelected),
  TypedReducer<Character, CharacterStatsChangedAction>(_characterStatsSelected),
  TypedReducer<Character, CharacterFinishAction>(_characterFinished),
]);

Character _characterCreated(
    Character character, CharacterCreatedAction action) {
  return action.character;
}

Character _characterWorldSelected(
    Character character, CharacterWorldSelectedAction action) {
  return action.character;
}

Character _characterGuildSelected(
    Character character, CharacterGuildSelectedAction action) {
  return action.character;
}

Character _characterFolkSelected(
    Character character, CharacterFolkSelectedAction action) {
  return action.character;
}

Character _characterNameSelected(
    Character character, CharacterNameSelectedAction action) {
  return action.character;
}

Character _characterStatsSelected(
    Character character, CharacterStatsChangedAction action) {
  return action.character;
}

Character _characterFinished(
    Character character, CharacterFinishAction action) {
  return action.character;
}

Character _characterLoaded(Character character, CharacterLoadedAction action) {
  return action.character;
}
