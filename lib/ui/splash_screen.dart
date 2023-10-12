import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/common/ui/images.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_container.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_stack.dart';
import 'package:legendary_buffalo/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashScrenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setPortraitMode();
    return Scaffold(
      body: ReusableContainer(
        image: bg1,
        child: ReusableStack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(topLeftDecor),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(logo),
                  RotationTransition(
                    turns: Tween(begin: 1.0, end: 0.0).animate(
                      CurvedAnimation(
                          parent: controller.animationController,
                          curve: Curves.linear),
                    ),
                    child: const Image(
                      image: AssetImage(shineCirc),
                      width: 200,
                      height: 200,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(topRightDecor),
            ),
          ],
        ),
      ),
    );
  }
}
