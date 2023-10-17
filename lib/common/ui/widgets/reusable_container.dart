import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final String image;
  final Widget child;
  final EdgeInsets padding;
  const ReusableContainer({
    super.key,
    required this.image,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
