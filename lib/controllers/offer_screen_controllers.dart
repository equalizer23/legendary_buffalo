import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/implementation/shared_pref_repo_impl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OfferScreenController extends GetxController {
  final sharedRepo = Get.find<SharedPrefRepoImpl>();
  var doublePress = false.obs;
  var isLoading = true.obs;
  var link = 'undefined'.obs;
  var notId = "null".obs;
  var arguments = Get.arguments;

  //If user clicks on the push notification, it enters a callback and returns notID
  void openHandler() {
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      notId.value = openedResult.notification.notificationId;
    });
  }

  //Changes link if there is notId
  void changeLink(String linkFromCahce) async {
    print('Link from Cache - $linkFromCahce');
    if (arguments != null) {
      link.value = linkFromCahce;
    } else {
      if (notId.value != 'null') {
        var linkWithNotId = linkFromCahce.replaceString(notId.value, 'notId=');
        link.value = linkWithNotId.replaceString('push', 'sub10=');
        print('Link after replacement - ${link.value}');
      } else {
        link.value = linkFromCahce.replaceString('direct', 'sub10=');
        print('Link after replacement without notId - ${link.value}');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    openHandler();
  }
}
