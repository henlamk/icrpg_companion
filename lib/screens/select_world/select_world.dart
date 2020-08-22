import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/world.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectWorld extends StatefulWidget {
  final DevToolsStore<AppState> store;

  SelectWorld({Key key, this.store}) : super(key: key);

  @override
  _SelectWorldState createState() => _SelectWorldState();
}

class _SelectWorldState extends State<SelectWorld> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  model.onSelectWorld(worlds[_pageController.page.toInt()]);
                  Keys.navKey.currentState.pushNamed(Routes.selectGuild);
                },
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: PageView(
                  controller: _pageController,
                  children: worlds
                      .map(
                        (world) => Container(
                          color: world.backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    world.name,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              )),
            ));
  }
}

class _ViewModel {
  final Function(World) onSelectWorld;

  _ViewModel({
    @required this.onSelectWorld,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onSelectWorld: (world) => store.dispatch(CharacterWorldSelectedAction(
            character: store.state.character.copyWith(world: world)))
        // onStart: () => store.dispatch(
        //     TimerStartedAction(timer: TimerModel(start: DateTime.now()))),

        );
  }
}
