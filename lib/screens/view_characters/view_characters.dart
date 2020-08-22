import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/character.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:icrpg_companion/screens/widgets/expansion_panel_list.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
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
        onInit: (store) {},
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.add),
                  onPressed: () {
                    model.onCreateNewCharacter();
                    Keys.navKey.currentState.pushNamed(Routes.selectWorld);
                  }),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(children: [
                    CustomExpansionPanelList(
                      onSelected: () => Keys.navKey.currentState
                          .pushReplacementNamed(Routes.viewCharacter),
                      items: [],
                    ),
                  ]),
                ),
              ),
            ));
  }
}

class _ViewModel {
  final Function() onCreateNewCharacter;

  _ViewModel({
    @required this.onCreateNewCharacter,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onCreateNewCharacter: () =>
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
