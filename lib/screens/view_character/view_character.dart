import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/screens/view_character/_page_views/view_static_data.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '_page_views/view_items.dart';
import '_page_views/view_stats.dart';

class ViewCharacter extends StatefulWidget {
  final DevToolsStore<AppState> store;

  ViewCharacter({Key key, this.store}) : super(key: key);

  @override
  _ViewCharacterState createState() => _ViewCharacterState();
}

class _ViewCharacterState extends State<ViewCharacter> {
  final PageController _pageController = PageController();
  List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      ViewStaticData(),
      ViewStats(),
      ViewItems(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: PageView(
              controller: _pageController,
              // physics: NeverScrollableScrollPhysics(),
              children: _pages
                  .map(
                    (e) => Container(
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
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
