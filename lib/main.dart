import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/controllers/app_controller.dart';
import 'package:legendary_buffalo/di/app_module.dart' as dep;
import 'package:legendary_buffalo/ui/offer_screen.dart';
import 'package:legendary_buffalo/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(AppController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Legendary Buffalo',
      home: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.link.value != 'null'
              ? OfferScreen(link: controller.link.value)
              : SplashScreen()),
    );
  }
}
