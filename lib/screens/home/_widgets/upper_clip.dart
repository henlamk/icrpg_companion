import 'package:flutter/material.dart';

class UpperClip extends CustomClipper<Path> {
  double _screenHeight;

  UpperClip(screenHeight) {
    _screenHeight = screenHeight;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, _screenHeight * 0.3);
    path.arcToPoint(Offset(size.width, _screenHeight * 0.5),
        radius: Radius.elliptical(10, 10));
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
