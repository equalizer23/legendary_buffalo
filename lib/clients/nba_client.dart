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
      'Content-type': 'application/json; charset=UTF-8',
      'x-rapidapi-key': '73127f5b8amsh1e2620f01805a7fp163bdajsn81433580efd2',
      'x-rapidapi-host': 'api-nba-v1.p.rapidapi.com'
    };
  }

  Future<Response> getPlayer(int id, String path) async {
    try {
      dio.options.queryParameters = {'id': id};
      Response response =
          await dio.get(path, options: Options(headers: _mainHeaders));
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
