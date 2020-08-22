import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/world.dart';
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
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () =>
                    Keys.navKey.currentState.pushNamed(Routes.selectGuild),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: PageView(
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
  final Function() onNavigateToSelectGuild;

  _ViewModel({
    @required this.onNavigateToSelectGuild,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        // onStart: () => store.dispatch(
        //     TimerStartedAction(timer: TimerModel(start: DateTime.now()))),

        );
  }
}
