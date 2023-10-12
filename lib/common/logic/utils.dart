import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/constants.dart';
import 'package:legendary_buffalo/models/api_request.dart';
import 'package:legendary_buffalo/ui/description_screen.dart';
import 'package:legendary_buffalo/ui/game_screen.dart';
import 'package:legendary_buffalo/ui/home_screen.dart';
import 'package:legendary_buffalo/ui/splash_screen.dart';

extension Decoder on String {
  //Returns a decoded string
  String decode() {
    final String key = "XyoloaFjVlHgMquO";
    final String alphabet = "abcdefghijklmnopqrstuvwxyz";
    StringBuffer sb = StringBuffer();

    for (int i = 0; i < this.length; i++) {
      final c = this[i];
      final k = key[i % key.length];

      final m = alphabet.indexOf(c.toLowerCase());
      final n = alphabet.indexOf(k.toLowerCase());

      if (m != -1) {
        final index = (m - n + alphabet.length) % alphabet.length;
        sb.write(c == c.toUpperCase()
            ? alphabet[index].toUpperCase()
            : alphabet[index]);
      } else {
        sb.write(c);
      }
    }

    return sb.toString();
  }

  //Returns a replaced string
  String replaceString(String key, String replacement) {
    var regex = RegExp("(?<=$replacement)[^&]+");
    return this.replaceAll(regex, key);
  }
}

//Returns a default Map for AppsFlyer
Map<String, String> defaultAppsData(String appsId) {
  return {
    "xd_dhaydn".decode(): "null",
    "xd_nvaswzw".decode(): "null",
    "zyaaoilw".decode(): "null",
    "jcrto_xxpcjk".decode(): "null",
    "xd_lr".decode(): "null",
    "zyaaoilw_tk".decode(): "null",
    "xbgph_nm".decode(): "null",
    "xb_tr".decode(): "null",
    "xbgph".decode(): "null",
    "af_userid": appsId
  };
}

//Returns a list of Get Pages
List<GetPage> getPages() {
  return [
    GetPage(
      name: Constants.gameScreenRoute,
      page: () => GameScreen(),
    ),
    GetPage(
      name: Constants.splashScreenRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Constants.homeScreenRoute,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Constants.descriptionScreenRoute,
      page: () => DescriptionScreen(),
    ),
  ];
}

//Sets a portrait mode in the screen
void setPortraitMode() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void navigateToScreen(
    {required Widget page, List<dynamic> arguments = const []}) {
  Get.to(
    page,
    duration: const Duration(seconds: 1),
    transition: Transition.fadeIn,
  );
}

//Navigates to different screens
void navigateOffScreen(
    {required Widget page, List<dynamic> arguments = const []}) {
  Get.off(
    () => page,
    arguments: arguments,
    duration: const Duration(seconds: 1),
    transition: Transition.fadeIn,
  );
}

//Returns a default array
List<String> defaultArray() {
  return ['null', '', '', '', '', '', '', '', '', ''];
}

//Default action
void defaultAction() {}

//Delay
void delay(int milliseconds, {VoidCallback action = defaultAction}) async {
  Future.delayed(Duration(milliseconds: milliseconds), action);
}

//Returns a random player id
int getRandomPlayerId() {
  var rand = Random();
  int number = rand.nextInt(100);
  return number;
}

//Returns a Map for Api Call
Map<String, dynamic> prepareApiData({required ApiRequest apiRequest}) {
  return {
    "appsFlyerData": apiRequest.appsData,
    "referrerData": apiRequest.referrer,
    "dynamicData": apiRequest.userData,
    "applicationTitle": apiRequest.title,
    "facebookData": apiRequest.deeplink
  };
}
