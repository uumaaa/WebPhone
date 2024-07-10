import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.action});
  final String text;
  final Color color;
  final double fontSize;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action(),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            decoration: TextDecoration.underline,
            fontSize: fontSize,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
