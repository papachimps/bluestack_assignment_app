import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/user.dart';
import '/controllers/feeds.dart';
import '/views/constants.dart';

import 'tournament_list.dart';
import 'user_profile_box.dart';
import 'user_statistics.dart';

class HomeBody extends StatelessWidget {
  final feedsController = Get.find<FeedsController>();
  final User user;
  HomeBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('built body');
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        var metrics = notification.metrics;
        // debugPrint(
        //     '${metrics.atEdge}, ${metrics.maxScrollExtent}, ${metrics.pixels}');
        if (metrics.pixels >= metrics.maxScrollExtent) {
          feedsController.fetchSetOfFeeds();
        }
        return true;
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            UserSpecifics(user: user),
            const TournamentsList(),
            Obx(
              () => Visibility(
                visible: feedsController.isFetchingFeeds.isTrue,
                child: Center(
                  child: Image.asset('assets/preloader.gif'),
                ),
              ),
            ),
            const SizedBox(height: kDefaultMargin * 2.5),
          ],
        ),
      ),
    );
  }
}

class UserSpecifics extends StatelessWidget {
  const UserSpecifics({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: kDefaultMargin / 2),
        UserProfileBox(
          userName: user.name,
          rating: user.rating,
          profileUrl: user.profileImgUrl,
        ),
        const SizedBox(height: kDefaultMargin),
        UserStatistics(
          tournamentPlayed: user.tournamentsPlayed,
          tournamentWon: user.tournamentsWon,
          winningPercentage: user.winningPercentage,
        ),
        const SizedBox(height: kDefaultMargin),
        Text(
          'Recommended for you'.tr,
          style: kUserTitleTextStyle,
        ),
        const SizedBox(height: kDefaultMargin / 2),
      ],
    );
  }
}
