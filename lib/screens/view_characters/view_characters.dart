import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/character.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class ViewCharacters extends StatefulWidget {
  final DevToolsStore<AppState> store;

  ViewCharacters({Key key, this.store}) : super(key: key);

  @override
  _ViewCharactersState createState() => _ViewCharactersState();
}

class _ViewCharactersState extends State<ViewCharacters> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.add),
                  onPressed: () =>
                      Keys.navKey.currentState.pushNamed(Routes.selectWorld)),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () => Keys.navKey.currentState
                          .pushNamed(Routes.viewCharacter),
                      child: Text('ViewCharacter'),
                    ),
                  ),
                ),
              ),
            ));
  }
}

class _ViewModel {
  final Function() onNavigateToSelectWorld;

  _ViewModel({
    @required this.onNavigateToSelectWorld,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onNavigateToSelectWorld: () =>
            store.dispatch(CharacterCreatedAction(character: Character()))
        // onStart: () => store.dispatch(
        //     TimerStartedAction(timer: TimerModel(start: DateTime.now()))),
        // onFinish: () => store.dispatch(TimerFinishedAction(
        //     timer: store.state.timer.copyWith(end: DateTime.now()))),
        // onRequestTime: () =>
        //     store.dispatch(TimerRequestedAction(timer: store.state.timer)));
        );
  }
}
