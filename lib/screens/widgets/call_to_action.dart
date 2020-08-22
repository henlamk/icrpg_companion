import 'package:flutter/material.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';

class CallToAction extends StatelessWidget {
  final String text;
  final Function func;

  const CallToAction({Key key, this.text, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: screenWidth(context) * .8,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
