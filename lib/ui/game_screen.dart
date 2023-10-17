import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/ui/images.dart';
import 'package:legendary_buffalo/common/ui/widgets/player_card.dart';
import 'package:legendary_buffalo/common/ui/widgets/reusable_container.dart';
import 'package:legendary_buffalo/controllers/game_screen_controller.dart';

class GameScreen extends StatelessWidget {
  final controller = Get.put(GameScreenController());
  GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameScreenController>(
      builder: (controller) {
        return Scaffold(
          body: ReusableContainer(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            image: bg1,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Image.asset(randomPlayer),
                        ),
                        PlayerCard(player: controller.player),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: InkWell(
                            onTap: () {
                              controller.isLoading.value = true;
                              controller.getPlayer();
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Image.asset(regenerate),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
