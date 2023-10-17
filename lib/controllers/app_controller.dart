import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/constants.dart';
import 'package:legendary_buffalo/implementation/shared_pref_repo_impl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppController extends GetxController {
  final sharedRepo = Get.find<SharedPrefRepoImpl>();
  var link = ''.obs;
  var isLoading = true.obs;

  //Init OneSignal SDK
  void _initOneSignal() {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId(Constants.onesignalKey);
  }

  Future<void> getLinkFromCache() async {
    link.value = await sharedRepo.get('link') ?? 'null';
    print('Link in App Controller - ${link.value}');
    isLoading.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
    _initOneSignal();
    await getLinkFromCache();
  }
}
