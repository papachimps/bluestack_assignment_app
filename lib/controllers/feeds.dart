import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/models/feed.dart';
import '../service/network.dart';

const String kApiBaseUrl =
    "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";

class FeedsController extends GetxController {
  RxList<Feed> feeds = <Feed>[].obs;
  RxBool isFetchingFeeds = false.obs;
  final RxString _cursor = ''.obs;

  @override
  void onInit() {
    fetchSetOfFeeds();
    super.onInit();
  }

  Future<void> fetchSetOfFeeds() async {
    isFetchingFeeds.value = true;
    var response = await _getTournamentsData(cursor: _cursor.value);
    var data = response['data'];

    _cursor.value = data['cursor'];
    for (dynamic tournament in data['tournaments']) {
      feeds.add(
        Feed(
          name: tournament['name'],
          gameName: tournament['game_name'],
          coverUrl: tournament['cover_url'],
        ),
      );
    }
    isFetchingFeeds.toggle();
    debugPrint('${feeds.length}');
  }

  Future _getTournamentsData({required String cursor}) async {
    NetworkService networkHelper = NetworkService(
      urlString: '$kApiBaseUrl&cursor=$cursor',
    );
    return await networkHelper.getData();
  }
}
