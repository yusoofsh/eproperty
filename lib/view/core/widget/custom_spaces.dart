import 'package:flutter/material.dart' hide Colors;

class CustomSpaces extends StatelessWidget {
  const CustomSpaces({
    this.width,
    this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
