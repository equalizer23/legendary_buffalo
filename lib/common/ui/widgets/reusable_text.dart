import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double size;
  const ReusableText({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontFamily: 'Josefin',
      ),
    );
  }
}
