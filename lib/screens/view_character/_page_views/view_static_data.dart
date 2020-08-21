import 'package:flutter/material.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';

class ViewStaticData extends StatelessWidget {
  const ViewStaticData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 32,
          left: 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Baldrian',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: screenWidth(context) * .8,
                child: Text(
                  'Elf, archer and druid with luck in Alfheim',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
