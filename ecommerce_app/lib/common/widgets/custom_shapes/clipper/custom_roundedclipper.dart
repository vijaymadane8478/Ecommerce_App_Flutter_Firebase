import 'package:flutter/material.dart';

class UcustomRoundedEdges extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    //Top to bottom line
    path.lineTo(0, size.height - 40);

    //FIRST CURVE
    Offset firstPointCurve1 = Offset(40, size.height);
    Offset secondPointCurve1 = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
      firstPointCurve1.dx,
      firstPointCurve1.dy,
      secondPointCurve1.dx,
      secondPointCurve1.dy,
    );

    //Second Curve
    Offset firstPointCurve2 = Offset(size.width - 40, size.height);
    Offset secondPointCurve2 = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstPointCurve2.dx,
      firstPointCurve2.dy,
      secondPointCurve2.dx,
      secondPointCurve2.dy,
    );

    //Bottom to top line
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
