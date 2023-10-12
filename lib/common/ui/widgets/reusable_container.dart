import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final String image;
  final Widget child;
  const ReusableContainer({
    super.key,
    required this.image,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
