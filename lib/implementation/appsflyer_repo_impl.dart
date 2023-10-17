import 'dart:async';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:legendary_buffalo/common/logic/constants.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/repositories/appsflyer_repository.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppsflyerRepoImpl extends AppsflyerRepository {
  //Fetches an Appsflyer data
  @override
  Future<Map<String, String>> initApps() async {
    final Completer<Map<String, String>> completer = Completer();
    final AppsFlyerOptions options =
        AppsFlyerOptions(afDevKey: Constants.appsKey, showDebug: true);
    final AppsflyerSdk appsflyerSdk = AppsflyerSdk(options);

    appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
    );

    String appsId = await _getAppsUID(appsflyerSdk);

    appsflyerSdk.onInstallConversionData((data) {
      Map<String, String> appsData;
      String status = data['status'];
      print('Status: $status');
      if (status == 'success') {
        var payload = data['payload'];

        String afStatus = payload['xd_dhaydn'.decode()] ?? 'null';
        String adId = payload["xb_tr".decode()] ?? 'null';
        String afChannel = payload["xd_nvaswzw".decode()] ?? 'null';
        String campaign = payload["zyaaoilw".decode()] ?? 'null';
        String mediaSource = payload["jcrto_xxpcjk".decode()] ?? 'null';
        String afAd = payload["xd_lr".decode()] ?? 'null';
        String campaignId = payload["zyaaoilw_tk".decode()] ?? 'null';
        String adsetId = payload["xbgph_nm".decode()] ?? 'null';
        String adset = payload["xbgph".decode()] ?? 'null';

        appsData = {
          "xd_dhaydn".decode(): Uri.encodeFull(afStatus),
          "xd_nvaswzw".decode(): Uri.encodeFull(afChannel),
          "jcrto_xxpcjk".decode(): Uri.encodeFull(mediaSource),
          "zyaaoilw".decode(): Uri.encodeFull(campaign),
          "xd_lr".decode(): Uri.encodeFull(afAd),
          "zyaaoilw_tk".decode(): Uri.encodeFull(campaignId),
          "xbgph_nm".decode(): Uri.encodeFull(adsetId),
          "xb_tr".decode(): Uri.encodeFull(adId),
          "xbgph".decode(): Uri.encodeFull(adset),
          "xd_fgewry".decode(): appsId
        };
        print('Apps data in Repo: $appsData');
        completer.complete(appsData);
      } else {
        appsData = defaultAppsData(appsId);
        print('Apps data in Repo Error: $appsData');
        completer.complete(appsData);
      }
    });
    return completer.future;
  }

  //Returns a Appsflyer User Id
  Future<String> _getAppsUID(AppsflyerSdk appsFlyerSdk) async {
    try {
      String appsUID = await appsFlyerSdk.getAppsFlyerUID() ?? 'null';
      OneSignal.shared.setExternalUserId(appsUID);
      print('AppsFlyerUID: $appsUID');
      return appsUID;
    } catch (e) {
      return 'null';
    }
  }
}
