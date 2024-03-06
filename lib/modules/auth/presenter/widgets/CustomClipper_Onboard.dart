import 'package:flutter/material.dart';

class MCustomClipper extends CustomClipper<Path> {
  static late Size sizeScreen;

  @override
  Path getClip(Size size) {
    double width = sizeScreen.width;
    double height = sizeScreen.height;

    // TODO: implement getClip
    Path path = Path();

    path.lineTo(0, height / 2);

    path.quadraticBezierTo(width / 2, height / 2 + 90, width, height / 2);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
