import 'package:flutter/material.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/common/ui/images.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_button.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_container.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_stack.dart';
import 'package:legendary_buffalo/ui/description_screen.dart';
import 'package:legendary_buffalo/ui/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ReusableContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          image: bg2,
          child: ReusableStack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(logo),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReusableButton(
                      button: buttonSquare,
                      text: 'Start',
                      action: () => navigateToScreen(page: GameScreen()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: ReusableButton(
                        button: buttonCircle,
                        text: 'Description',
                        action: () {
                          navigateToScreen(page: const DescriptionScreen());
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
