import 'package:flutter/material.dart';

class LowerClip extends CustomClipper<Path> {
  double _screenHeight;

  LowerClip(screenHeight) {
    _screenHeight = screenHeight;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, _screenHeight * .3);
    path.lineTo(0, _screenHeight);

    path.arcToPoint(Offset(size.width, 10), radius: Radius.elliptical(10, 10));

    path.lineTo(size.width, _screenHeight);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
