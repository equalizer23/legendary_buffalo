import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScrenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  // final fbRepo = FacebookRepoImpl();
  // final appsRepo = AppsflyerRepoImpl();
  // final userRepo = UserDataRepoImpl();
  // final sharedRepo = SharedPrefRepoImpl();
  // final apiRepo = ApiRepoImpl(apiClient: Get.find<ApiClient>());

  // Completer<void> appsDataCompleter = Completer<void>();
  // Completer<void> deeplinkCompleter = Completer<void>();
  // Completer<void> userDataCompleter = Completer<void>();
  // Completer<void> referrerCompleter = Completer<void>();

  // var deeplink = 'undefined'.obs;
  // RxMap<String, String> userData = {'default': 'undefined'}.obs;
  // RxMap<String, dynamic> appsData = {'default': 'undefined'}.obs;
  // var referrer = 'undefined'.obs;

  // //Fetches AppsFlyer Data
  // void _fetchApps() async {
  //   appsData.value = await appsRepo.initApps();
  //   if (appsData.length > 1) {
  //     appsDataCompleter.complete();
  //     print('Apps data is ready ${appsData}');
  //   }
  // }

  // //Fetches User data from Repository
  // void _getUserData() async {
  //   userData.value = await userRepo.getUserData();
  //   if (userData.length > 1) {
  //     userDataCompleter.complete();
  //     print("User data is ready ${userData}");
  //   }
  // }

  // //Fetches all data
  // void fetchAllData() async {
  //   _getUserData();
  //   _getDeeplink();
  //   _getReferrer();
  //   _fetchApps();

  //   Future.wait([
  //     appsDataCompleter.future,
  //     userDataCompleter.future,
  //     referrerCompleter.future,
  //     deeplinkCompleter.future
  //   ]).then((_) {
  //     print('User data in Controller - $userData');
  //     ApiRequest apiRequest = ApiRequest(
  //       appsData: appsData,
  //       userData: userData,
  //       deeplink: deeplink.value,
  //       title: 'Crazy Pirates',
  //       referrer: referrer.value,
  //     );
  //     _getLink(apiRequest);
  //   });
  // }

  // //Fetches facebook deeplink
  // void _getDeeplink() async {
  //   fbRepo.initFacebook();
  //   deeplink.value = await fbRepo.getDeeplink();
  //   if (deeplink != 'undefined') {
  //     deeplinkCompleter.complete();
  //   }
  // }

  // //Fetches link from the Server
  // void _getLink(ApiRequest apiRequest) async {
  //   var data = prepareApiData(apiRequest: apiRequest);
  //   print('Data - $data');
  //   var response = await apiRepo.getLink(data, '/build-decoded');

  //   print('OneSignal Tag - ${response.data["oneSignalTag"]}');
  //   OneSignal.shared.sendTag("psp_opu".decode(), response.data["oneSignalTag"]);

  //   String link = response.data['content'];
  //   print('Link from Response - $link');
  //   await sharedRepo.save(link, 'link');
  //   delay(3000,
  //       action: () => Get.off(OfferScreen(link: link), arguments: ['first']));
  // }

  // //Fetches a referrer
  // void _getReferrer() async {
  //   referrer.value = await userRepo.getReferrer();
  //   if (referrer.value != 'undefined') {
  //     referrerCompleter.complete();
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat();
    Permission.notification.request();
    // fetchAllData();
  }

  //Disposes an animation
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
