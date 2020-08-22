import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SelectName extends StatefulWidget {
  SelectName({Key key}) : super(key: key);

  @override
  _SelectNameState createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  model.onNameSelected(_textController.text);
                  Keys.navKey.currentState.pushNamed(Routes.editStats);
                },
              ),
              body: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          verticalSpaceMassive,
                          Text(
                              'Enter a name, but beware, for once chosen, you cannot change it!'),
                          verticalSpaceSmall,
                          Form(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: _textController,
                                decoration: InputDecoration(
                                    hintText: 'Name', border: InputBorder.none),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300].withOpacity(.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                        ],
                      ))),
            ));
  }
}

class _ViewModel {
  final Function(String) onNameSelected;

  _ViewModel({
    @required this.onNameSelected,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onNameSelected: (name) => store.dispatch(CharacterNameSelectedAction(
            character: store.state.character.copyWith(name: name)))
        // onStart: () => store.dispatch(
        //     TimerStartedAction(timer: TimerModel(start: DateTime.now()))),

        );
  }
}
