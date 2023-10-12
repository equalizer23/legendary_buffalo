import 'package:flutter/material.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_text.dart';

class ReusableButton extends StatelessWidget {
  final String button;
  final String text;
  final VoidCallback action;

  const ReusableButton({
    super.key,
    required this.button,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: action,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(button),
            ),
            ReusableText(text: text, size: 34)
          ],
        ));
  }
}
