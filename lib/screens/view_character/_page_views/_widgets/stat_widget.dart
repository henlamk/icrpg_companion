import 'package:flutter/material.dart';
import 'package:icrpg_companion/models/stat.dart';
import 'package:icrpg_companion/util/enums.dart';

class StatWidget extends StatelessWidget {
  final StatTypes statTypes;

  const StatWidget({Key key, this.statTypes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          constraints: BoxConstraints(minHeight: 60, minWidth: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                getStringValue<StatTypes>(statTypes),
              ),
              Text(
                '0',
              )
            ],
          ),
          duration: Duration(milliseconds: 200),
          // decoration: BoxDecoration(
          //     border: Border.all(width: _width, color: _borderColor))),
        ),
      ),
    );
  }
}
