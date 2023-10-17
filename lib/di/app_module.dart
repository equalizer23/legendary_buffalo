import 'package:get/get.dart';
import 'package:legendary_buffalo/clients/nba_client.dart';
import 'package:legendary_buffalo/common/logic/constants.dart';
import 'package:legendary_buffalo/implementation/appsflyer_repo_impl.dart';
import 'package:legendary_buffalo/implementation/facebook_repo_impl.dart';
import 'package:legendary_buffalo/implementation/game_api_repo_impl.dart';
import 'package:legendary_buffalo/implementation/shared_pref_repo_impl.dart';
import 'package:legendary_buffalo/implementation/user_data_repo_impl.dart';

Future<void> init() async {
  //Clients
  Get.lazyPut(() => NbaClient(baseUrl: Constants.nbaUrl));

  //Repositories
  Get.lazyPut(() => GameApiRepoImpl(client: Get.find<NbaClient>()));
  Get.lazyPut(() => SharedPrefRepoImpl());
  Get.lazyPut(() => AppsflyerRepoImpl());
  Get.lazyPut(() => FacebookRepoImpl());
  Get.lazyPut(() => UserDataRepoImpl());
}
