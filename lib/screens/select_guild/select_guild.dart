import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/guild.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectGuild extends StatefulWidget {
  SelectGuild({Key key}) : super(key: key);

  @override
  _SelectGuildState createState() => _SelectGuildState();
}

class _SelectGuildState extends State<SelectGuild> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () =>
                    Keys.navKey.currentState.pushNamed(Routes.selectFolk),
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: PageView(
                  children: guilds
                      .map(
                        (g) => Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    g.name,
                                  ),
                                  Image.asset(g.assetName)
                                ],
                              ),
                              verticalSpaceTiny,
                              AutoSizeText(
                                g.line,
                                maxLines: 1,
                              ),
                              verticalSpaceMedium,
                              Text(
                                'starter reward',
                              ),
                              Text(g.starterReward),
                              verticalSpaceMedium,
                              Text('milestones'),
                              verticalSpaceTiny,
                              Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: g.mileStones
                                      .map((m) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(m,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.left
                                                    // g.mileStones.indexOf(m).isOdd
                                                    //     ? TextAlign.left
                                                    //     : TextAlign.right,
                                                    ),
                                              ),
                                              verticalSpaceSmall,
                                            ],
                                          ))
                                      .toList()

                                  // ListView.builder(
                                  //   itemCount: g.mileStones.length,
                                  //   shrinkWrap: true,
                                  //   itemBuilder: (context, index) {
                                  //     return Text(
                                  //       g.mileStones[index],
                                  //       style: listEntryDescriptionTextStyle,
                                  //       textAlign: TextAlign.left,
                                  //     );
                                  //   },
                                  // ),
                                  // ],
                                  ),
                              // Stack(
                              //   children: [
                              //     Align(
                              //       alignment: Alignment.bottomCenter,
                              //       child: ClipPath(
                              //         clipper: GuildBackgroundClipper(),
                              //         child:
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
