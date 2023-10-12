class ApiRequest {
  final Map<String, dynamic> appsData;
  final Map<String, String> userData;
  final String deeplink;
  final String title;
  final String referrer;

  ApiRequest({
    required this.appsData,
    required this.userData,
    required this.deeplink,
    required this.title,
    required this.referrer,
  });
}
