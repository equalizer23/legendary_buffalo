import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/link_builder.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/implementation/appsflyer_repo_impl.dart';
import 'package:legendary_buffalo/implementation/facebook_repo_impl.dart';
import 'package:legendary_buffalo/implementation/user_data_repo_impl.dart';
import 'package:legendary_buffalo/models/link.dart';
import 'package:legendary_buffalo/repositories/shared_pref_repo.dart';
import 'package:legendary_buffalo/ui/offer_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScrenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  final fbRepo = Get.find<FacebookRepoImpl>();
  final appsRepo = Get.find<AppsflyerRepoImpl>();
  final userRepo = Get.find<UserDataRepoImpl>();
  final sharedRepo = Get.find<SharedPrefRepo>();

  Completer<void> appsDataCompleter = Completer<void>();
  Completer<void> deeplinkCompleter = Completer<void>();
  Completer<void> userDataCompleter = Completer<void>();
  Completer<void> referrerCompleter = Completer<void>();

  var deeplink = 'undefined'.obs;
  RxList<String> userData = ['undefined'].obs;
  RxMap<String, dynamic> appsData = {'default': 'undefined'}.obs;
  var referrer = 'undefined'.obs;

  //Fetches AppsFlyer Data
  void _fetchApps() async {
    appsData.value = await appsRepo.initApps();
    if (appsData.length > 1) {
      appsDataCompleter.complete();
      print('Apps data is ready ${appsData}');
    }
  }

  //Fetches User data from Repository
  void _getUserData() async {
    userData.value = await userRepo.getUserData();
    if (userData.length > 1) {
      userDataCompleter.complete();
      print("User data is ready ${userData}");
    }
  }

  //Fetches all data
  void fetchAllData() async {
    _getUserData();
    _getDeeplink();
    _getReferrer();
    _fetchApps();

    Future.wait([
      appsDataCompleter.future,
      userDataCompleter.future,
      referrerCompleter.future,
      deeplinkCompleter.future
    ]).then((_) {
      print('User data in Controller - $userData');
      _buildLink();
    });
  }

  //Fetches facebook deeplink
  void _getDeeplink() async {
    deeplink.value = await fbRepo.getDeeplink();
    if (deeplink != 'undefined') {
      deeplinkCompleter.complete();
    }
  }

  //Builds a and saves a link in shared preferences
  void _buildLink() async {
    var subList = createSubList(deeplink.value, appsData);

    String? push = subList[1] == '' || subList.length == 1
        ? "lpulbih".decode()
        : subList[1];

    Link linkData = Link(
      appsData: appsData,
      subList: subList,
      userData: userData,
      push: push,
    );

    OneSignal.shared.sendTag("psp_opu".decode(), push);

    String link = LinkBuilder(linkData: linkData).buildLink();
    await sharedRepo.save(link, 'link');
    navigateOffScreen(page: OfferScreen(link: link), arguments: ['first']);
  }

  //Fetches a referrer
  void _getReferrer() async {
    referrer.value = await userRepo.getReferrer();
    if (referrer.value != 'undefined') {
      referrerCompleter.complete();
    }
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat();
    Permission.notification.request();
    fetchAllData();
  }

  //Disposes an animation
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  List<String?> createSubList(String deeplink, Map<String, dynamic> apps) {
    List<String?> array;
    try {
      if (deeplink != "undefined" &&
          deeplink.isNotEmpty &&
          deeplink != "null") {
        apps["zyaaoilw".decode()] = deeplink;
        array = deeplink.split("://").elementAt(1).split("_");
      } else if (apps["zyaaoilw".decode()] != null &&
          apps["zyaaoilw".decode()] != "null") {
        array = apps["zyaaoilw".decode()].toString().split("_");
      } else {
        array = defaultArray();
      }
      update();
      print('Array $array');
      return array;
    } catch (e) {
      print("Error $e");
      return defaultArray();
    }
  }
}
