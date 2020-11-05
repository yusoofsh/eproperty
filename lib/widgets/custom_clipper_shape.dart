import 'package:flutter/material.dart';

class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(
      0.0,
      size.height * 0.8,
    );

    final firstEndpoint = Offset(
      size.width * 0.6,
      size.height * 0.55,
    );
    final firstControlPoint = Offset(
      size.width * 0.40,
      size.height,
    );

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndpoint.dx,
      firstEndpoint.dy,
    );

    final secondEndpoint = Offset(
      size.width * 0.8,
      size.height * 0.35,
    );
    final secondControlPoint = Offset(
      size.width * 0.7,
      size.height * 0.35,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndpoint.dx,
      secondEndpoint.dy,
    );

    final thirdEndpoint = Offset(
      size.width * 0.9,
      size.height * 0.25,
    );
    final thirdControlPoint = Offset(
      size.width * 0.9,
      size.height * 0.35,
    );

    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndpoint.dx,
      thirdEndpoint.dy,
    );

    final fourthEndpoint = Offset(
      size.width * 0.78,
      size.height * 0.15,
    );
    final fourthControlPoint = Offset(
      size.width * 0.9,
      size.height * 0.15,
    );

    path.quadraticBezierTo(
      fourthControlPoint.dx,
      fourthControlPoint.dy,
      fourthEndpoint.dx,
      fourthEndpoint.dy,
    );

    final fifthEndpoint = Offset(
      size.width * 0.5,
      size.height * 0,
    );
    final fifthControlPoint = Offset(
      size.width * 0.6,
      size.height * 0.15,
    );

    path.quadraticBezierTo(
      fifthControlPoint.dx,
      fifthControlPoint.dy,
      fifthEndpoint.dx,
      fifthEndpoint.dy,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
