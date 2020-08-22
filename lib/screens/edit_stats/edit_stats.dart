import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/screens/view_character/_page_views/_widgets/stat_widget.dart';
import 'package:icrpg_companion/util/enums.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EditStats extends StatefulWidget {
  EditStats({Key key}) : super(key: key);

  @override
  _EditStatsState createState() => _EditStatsState();
}

class _EditStatsState extends State<EditStats> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () =>
                    Keys.navKey.currentState.pushNamed(Routes.finishCharacter),
              ),
              body: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: CircleAvatar(
                                  maxRadius: 20,
                                  child: Center(
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Colors.black12,
                                ),
                              ),
                              InkWell(
                                child: CircleAvatar(
                                  maxRadius: 20,
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Colors.black12,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  StatWidget(
                                    statTypes: StatTypes.HP,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.ARM,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.STR,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  StatWidget(
                                    statTypes: StatTypes.DEX,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.CON,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.WIS,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  StatWidget(
                                    statTypes: StatTypes.INT,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.CHA,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.BSC,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  StatWidget(
                                    statTypes: StatTypes.WPN,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.WPN,
                                  ),
                                  StatWidget(
                                    statTypes: StatTypes.ULT,
                                  ),
                                ],
                              ),
                              verticalSpaceMedium
                            ],
                          )
                        ],
                      ))),
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
