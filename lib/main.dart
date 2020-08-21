import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icrpg_companion/redux/store.dart';

import 'app.dart';

void main() async {
  final store = await createReduxStore();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(IcrpgCompanionApp(store));
}
