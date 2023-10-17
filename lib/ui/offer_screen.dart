import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/controllers/offer_screen_controllers.dart';
import 'package:legendary_buffalo/ui/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferScreen extends StatelessWidget {
  final String link;
  OfferScreen({super.key, required this.link});

  late WebViewController _webViewController;

  final controller = Get.put(OfferScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (await _webViewController.canGoBack()) {
            if (controller.doublePress.value) {
              _webViewController.loadUrl(controller.link.value);
            }

            controller.doublePress.value = true;
            _webViewController.goBack();

            delay(1300, action: () {
              controller.doublePress.value = false;
            });
          }
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated:
                      (WebViewController webViewController) async {
                    _webViewController = webViewController;
                    delay(900, action: () {
                      controller.changeLink(link);
                      _webViewController.loadUrl(controller.link.value);
                    });
                  },
                  onPageStarted: (url) {
                    print('onPageStarted');
                    controller.isLoading.value = false;
                  },
                  onPageFinished: (url) async {
                    String? title = await _webViewController.getTitle();
                    if (title?.contains("mz0rfoxml3v0".decode()) == true) {
                      navigateOffScreen(page: const HomeScreen());
                    }
                  },
                  navigationDelegate: (request) {
                    final url = request.url;
                    try {
                      if (url.startsWith("erhag://o.tk/ziwkavlh".decode())) {
                        launchUrl(Uri.parse(url));
                        return NavigationDecision.navigate;
                      } else if (url.startsWith("erha://".decode()) ||
                          url.startsWith("erhag://".decode())) {
                        return NavigationDecision.navigate;
                      } else if (url.startsWith("jywwho:".decode())) {
                        final email = url.replaceFirst("jywwho:".decode(), "");
                        launchUrl(Uri.parse("mailto:$email"));
                        return NavigationDecision.navigate;
                      } else if (url.startsWith("qcz:".decode())) {
                        launchUrl(Uri.parse(url));
                        return NavigationDecision.navigate;
                      } else {
                        launchUrl(Uri.parse(url));
                        return NavigationDecision.navigate;
                      }
                    } catch (e) {
                      print("Error: $e");
                      return NavigationDecision.navigate;
                    }
                  },
                ),
                if (controller.isLoading.value)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
