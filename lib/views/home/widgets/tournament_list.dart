import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '/models/feed.dart';
import '/controllers/feeds.dart';

import 'tournament_list_tile.dart';

class TournamentsList extends StatelessWidget {
  const TournamentsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final feedsController = Get.find<FeedsController>();
    return Obx(
      () {
        // debugPrint('rebuilt list');
        return Column(
          children: feedsController.feeds.map(
            (element) {
              return TournamentListTile(
                key: Key(element.name),
                feed: element,
              );
            },
          ).toList(),
        );
      },
    );
    //  return Obx(() => ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: feedsController.feeds.length,
    //   // padding: EdgeInsets.only(bottom: kDefaultMargin /2),
    //   // cacheExtent: 20,
    //   itemBuilder: (context, index) {
    //     return TournamentListTile(
    //       key: Key('$index'),
    //       feed: feedsController.feeds[index],
    //     );
    //   },
    // ),
    // );
  }
}
