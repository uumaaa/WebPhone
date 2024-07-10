import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
    );
  }
}
