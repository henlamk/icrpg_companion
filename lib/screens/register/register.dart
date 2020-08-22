import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/models/app_state_model.dart';
import 'package:icrpg_companion/redux/actions/character_actions.dart';
import 'package:icrpg_companion/redux/actions/index.dart';
import 'package:icrpg_companion/screens/widgets/call_to_action.dart';
import 'package:icrpg_companion/screens/widgets/form_text_field.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                verticalSpaceMassive,
                Text('Register'),
                verticalSpaceSmall,
                Form(
                  child: Column(
                    children: [
                      CustomFormTextField(
                        text: 'e-mail address',
                        textController: _mailController
                          ..text = 'hendrik@icrpg.com',
                      ),
                      verticalSpaceMedium,
                      CustomFormTextField(
                        text: 'password',
                        textController: _passwordController..text = '123345678',
                      ),
                      verticalSpaceMedium,
                      CallToAction(
                          text: 'Register',
                          func: () => model.onRegister(
                              _mailController.text, _passwordController.text)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final Function(String, String) onRegister;

  _ViewModel({
    @required this.onRegister,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onRegister: (mail, password) =>
            store.dispatch(register(email: mail, password: password)));
  }
}
