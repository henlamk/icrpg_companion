import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FinishCharacter extends StatefulWidget {
  FinishCharacter({Key key}) : super(key: key);

  @override
  _FinishCharacterState createState() => _FinishCharacterState();
}

class _FinishCharacterState extends State<FinishCharacter> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  model.onCharacterFinished();
                  Keys.navKey.currentState.pushNamed(Routes.viewCharacters);
                },
              ),
              body: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(child: Text(widget.toString())))),
            ));
  }
}

class _ViewModel {
  final Function() onCharacterFinished;

  _ViewModel({
    @required this.onCharacterFinished,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onCharacterFinished: () => store
            .dispatch(CharacterFinishAction(character: store.state.character)));
  }
}
