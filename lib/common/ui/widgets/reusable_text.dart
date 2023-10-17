import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const ReusableText(
      {super.key,
      required this.text,
      required this.size,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Josefin',
      ),
    );
  }
}
