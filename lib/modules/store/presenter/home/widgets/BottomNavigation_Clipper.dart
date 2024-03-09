import 'package:flutter/material.dart';

class MBottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = 100;
    double width = size.width;

    double bwidth = 90;
    // TODO: implement getClip
    Path path = Path();

    path.quadraticBezierTo(width / 4, 25, width / 2 - bwidth / 2 - 15, 25);
    path.quadraticBezierTo(
        width / 2 - bwidth / 2, 25, width / 2 - bwidth / 2, 45);
    path.quadraticBezierTo(width / 2 - bwidth / 2, 70, width / 2, 70);
    path.quadraticBezierTo(
        width / 2 + bwidth / 2, 70, width / 2 + bwidth / 2, 45);
    path.quadraticBezierTo(
        width / 2 + bwidth / 2, 25, width / 2 + bwidth / 2 + 15, 25);
    path.quadraticBezierTo(width * 3 / 4, 25, width, 0);

    path.lineTo(width, 100);
    path.lineTo(0, 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

// class MBottomAppNotch extends NotchedShape {
//   @override
//   Path getOuterPath(Rect host, Rect? guest) {
//     // TODO: implement getOuterPath
//     double height = 100;
//     double width = host.width;

//     double bwidth = 90;
//     // TODO: implement getClip
//     Path path = Path();

//     path.quadraticBezierTo(width / 4, 25, width / 2 - bwidth / 2 - 15, 25);
//     path.quadraticBezierTo(
//         width / 2 - bwidth / 2, 25, width / 2 - bwidth / 2, 45);
//     path.quadraticBezierTo(width / 2 - bwidth / 2, 70, width / 2, 70);
//     path.quadraticBezierTo(
//         width / 2 + bwidth / 2, 70, width / 2 + bwidth / 2, 45);
//     path.quadraticBezierTo(
//         width / 2 + bwidth / 2, 25, width / 2 + bwidth / 2 + 15, 25);
//     path.quadraticBezierTo(width * 3 / 4, 25, width, 0);

//     path.lineTo(width, 100);
//     path.lineTo(0, 100);
//     path.close();
//     return path;
//   }
// }
