import 'package:flutter/material.dart' hide Colors;

@immutable
class CustomClipShadow extends StatelessWidget {
  const CustomClipShadow({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}

class _ClipShadowPainter extends CustomPainter {
  _ClipShadowPainter({
    @required this.shadow,
    @required this.clipper,
  });

  final Shadow shadow;
  final CustomClipper<Path> clipper;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = shadow.toPaint();
    final clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(
      clipPath,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
