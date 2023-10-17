import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_text.dart';

class ReusableRow extends StatelessWidget {
  final String description;
  final String value;
  const ReusableRow(
      {super.key, required this.value, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: description,
          size: 18,
          color: Colors.black,
        ),
        ReusableText(text: value, size: 18, color: Colors.black)
      ],
    );
  }
}
