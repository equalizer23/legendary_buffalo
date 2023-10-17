import 'dart:io';

import 'package:dio/dio.dart';

class NbaClient {
  final String baseUrl;
  late Dio dio;
  late Map<String, dynamic> _mainHeaders;

  NbaClient({required this.baseUrl}) {
    dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    _mainHeaders = {
      'X-RapidAPI-Key': 'a7258b7a15msh0f9a27ee04eae7ep1bca14jsn716cd65b6a1f',
      'X-RapidAPI-Host': 'api-nba-v1.p.rapidapi.com'
    };
  }

  Future<Response> getPlayer(int id, String path) async {
    print('Base url - $baseUrl');
    print('Path - $path');
    try {
      var params = {"id": id};
      Response response = await dio.get(path,
          options: Options(
            headers: _mainHeaders,
          ),
          queryParameters: params);
      return response;
    } on IOException catch (e) {
      print(e);
      return Response(
          statusMessage: e.toString(),
          statusCode: 500,
          requestOptions: RequestOptions(path: path));
    } catch (e) {
      return Response(
        statusMessage: e.toString(),
        statusCode: 500,
        requestOptions: RequestOptions(path: path),
      );
    }
  }
}
