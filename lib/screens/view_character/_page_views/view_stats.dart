import 'package:flutter/material.dart';
import 'package:icrpg_companion/screens/widgets/call_to_action.dart';
import 'package:icrpg_companion/screens/widgets/icon_button.dart';
import 'package:icrpg_companion/util/enums.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';

import '_widgets/stat_widget.dart';

class ViewStats extends StatefulWidget {
  const ViewStats({Key key}) : super(key: key);

  @override
  _ViewStatsState createState() => _ViewStatsState();
}

class _ViewStatsState extends State<ViewStats> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomIconButton(icon: Icons.remove),
              CustomIconButton(icon: Icons.add)
            ],
          ),
          verticalSpaceMedium,
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ],
          ),
        ],
      ),
      Positioned(
        bottom: 32,
        left: 32,
        child: CallToAction(
          text: 'Edit',
        ),
      ),
    ]);
  }
}
