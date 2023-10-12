import 'package:dio/dio.dart' as res;
import 'package:get/get.dart';
import 'package:legendary_buffalo/common/logic/utils.dart';
import 'package:legendary_buffalo/implementation/game_api_repo_impl.dart';
import 'package:legendary_buffalo/models/player.dart';

class GameScreenController extends GetxController {
  GameApiRepoImpl gameRepo = GameApiRepoImpl(client: Get.find());
  var player;

  void getPlayer() async {
    int id = getRandomPlayerId();
    res.Response response = await gameRepo.getPlayer(id, '/players');
    if (response.statusCode == 200) {
      var data = response.data['response'][0];
      player = Player(
          name: "${data['firstname']} ${data['lastname']}",
          nbaStart: "${data['nba']['start']}",
          birth: "${data['birth']['date']}",
          weight: "${data['weight']['kilograms']}");
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPlayer();
  }
}
