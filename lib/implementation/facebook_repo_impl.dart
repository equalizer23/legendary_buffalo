import 'dart:async';

import 'package:flutter_facebook_app_links/flutter_facebook_app_links.dart';
import 'package:legendary_buffalo/repositories/facebook_repository.dart';
import 'dart:io' show Platform;

class FacebookRepoImpl extends FacebookRepository {
  Completer<String> completer = Completer();
  @override
  Future<String> getDeeplink() async {
    try {
      if (Platform.isIOS) {
        String deeplink = await FlutterFacebookAppLinks.getDeepLink();
        completer.complete(deeplink);
        print("Deeplink: $deeplink");
      } else {
        String deeplink = await FlutterFacebookAppLinks.initFBLinks();
        completer.complete(deeplink);
        print("Deeplink: $deeplink");
      }
      return completer.future;
    } catch (e) {
      print('Deeplink $e');
      return 'null';
    }
  }
}
