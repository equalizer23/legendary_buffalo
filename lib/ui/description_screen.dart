import 'package:flutter/material.dart';
import 'package:legendary_buffalo/common/ui/images.dart';
import 'package:legendary_buffalo/common/ui/text.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_container.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_text.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ReusableContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          image: bg3,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(logo),
                  ReusableText(
                    text: StringText.rules,
                    size: 18,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
