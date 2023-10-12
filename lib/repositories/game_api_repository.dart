import 'package:dio/dio.dart';

abstract class GameApiRepo {
  Future<Response> getPlayer(int id, String path);
}
