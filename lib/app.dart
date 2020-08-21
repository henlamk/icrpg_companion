import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:icrpg_companion/screens/home/home.dart';
import 'package:icrpg_companion/util/colors.dart';
import 'package:redux/redux.dart';
import 'models/app_state_model.dart';

class Routes {
  static final homeScreen = "/home";
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
          primaryColor: CustomColors.white,
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
          builder: (BuildContext context, Store<dynamic> store) => Home(
            store: store,
          ),
        ),
        navigatorKey: Keys.navKey,
        routes: {},
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
