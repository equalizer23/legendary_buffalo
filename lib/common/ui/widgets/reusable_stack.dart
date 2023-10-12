import 'package:flutter/material.dart';

class ReusableStack extends StatelessWidget {
  final List<Widget> children;
  const ReusableStack({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: children);
  }
}
