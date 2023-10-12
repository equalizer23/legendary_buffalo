import 'package:dio/dio.dart';
import 'package:legendary_buffalo/clients/nba_client.dart';
import 'package:legendary_buffalo/repositories/game_api_repository.dart';

class GameApiRepoImpl extends GameApiRepo {
  final NbaClient client;
  GameApiRepoImpl({required this.client});

  @override
  Future<Response> getPlayer(int id, String path) async {
    Response response = await client.getPlayer(id, path);
    return response;
  }
}
