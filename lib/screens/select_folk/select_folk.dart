import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/models/folk.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectFolk extends StatefulWidget {
  SelectFolk({Key key}) : super(key: key);

  @override
  _SelectFolkState createState() => _SelectFolkState();
}

class _SelectFolkState extends State<SelectFolk> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  model.onFolkSelected(folks[_pageController.page.toInt()]);
                  Keys.navKey.currentState.pushNamed(Routes.selectName);
                },
              ),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: PageView(
                  controller: _pageController,
                  children: folks
                      .map(
                        (f) => Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    f.name,
                                  ),
                                  // Image.asset(g.assetName)
                                ],
                              ),
                              verticalSpaceMedium,
                              Text(
                                'bonus',
                              ),
                              Text(f.bonusText),
                              verticalSpaceMedium,
                              Text('lore'),
                              Text(f.description,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify),
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
  final Function(Folk) onFolkSelected;

  _ViewModel({
    @required this.onFolkSelected,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onFolkSelected: (folk) => store.dispatch(CharacterFolkSelectedAction(
            character: store.state.character.copyWith(folk: folk))));
  }
}
