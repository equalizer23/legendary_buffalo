import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
