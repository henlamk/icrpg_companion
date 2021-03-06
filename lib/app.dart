import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:icrpg_companion/screens/finish_character/finish_character.dart';

import 'package:icrpg_companion/util/colors.dart';
import 'package:redux/redux.dart';
import 'models/app_state_model.dart';
import 'screens/add_item/add_item.dart';
import 'screens/edit_stats/edit_stats.dart';
import 'screens/login/login.dart';
import 'screens/register/register.dart';
import 'screens/select_folk/select_folk.dart';
import 'screens/select_name/select_name.dart';
import 'screens/select_world/select_world.dart';
import 'screens/select_guild/select_guild.dart';
import 'screens/view_character/view_character.dart';
import 'screens/view_characters/view_characters.dart';

class Routes {
  static final homeScreen = "/home";
  static final viewCharacters = '/viewCharacters';
  static final selectWorld = '/selectWorld';
  static final selectGuild = '/selectGuild';
  static final selectFolk = '/selectFolk';
  static final selectName = '/selectName';
  static final editStats = '/editStats';
  static final finishCharacter = '/finishCharacter';
  static final viewCharacter = '/viewCharacter';
  static final addItem = '/addItem';
  static final login = '/login';
  static final register = '/register';
}

class Keys {
  static final navKey = new GlobalKey<NavigatorState>();
}

class IcrpgCompanionApp extends StatefulWidget {
  final Store<AppState> store;

  IcrpgCompanionApp(this.store);

  @override
  _IcrpgCompanionAppState createState() => _IcrpgCompanionAppState();
}

class _IcrpgCompanionAppState extends State<IcrpgCompanionApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Time Zero',
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: CustomColors.accent,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.kulimParkTextTheme(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: StoreBuilder<AppState>(
          onInit: (store) {
            // store.dispatch(loadUserData());
          },
          builder: (BuildContext context, Store<dynamic> store) => Login(),
        ),
        navigatorKey: Keys.navKey,
        routes: {
          // Routes.homeScreen: (context) => HomeScaffold(),
          Routes.viewCharacters: (context) => ViewCharacters(),
          Routes.selectGuild: (context) => SelectGuild(),
          Routes.selectWorld: (context) => SelectWorld(),
          Routes.selectFolk: (context) => SelectFolk(),
          Routes.selectName: (context) => SelectName(),
          Routes.editStats: (context) => EditStats(),
          Routes.finishCharacter: (context) => FinishCharacter(),
          Routes.viewCharacter: (context) => ViewCharacter(),
          Routes.addItem: (context) => AddItem(),
          Routes.login: (context) => Login(),
          Routes.register: (context) => Register(),
        },
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
