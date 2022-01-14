import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '/views/constants.dart';

class UserStatistics extends StatelessWidget {
  final int tournamentPlayed;
  final int tournamentWon;
  final int winningPercentage;

  const UserStatistics({
    Key? key,
    this.tournamentPlayed = 34,
    this.tournamentWon = 9,
    this.winningPercentage = 26,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDefaultMargin),
      child: SizedBox(
        height: kDefaultMargin * 4,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserStatsTile(
              gradient: kTourPlayedGradient,
              value: '$tournamentPlayed',
              title: 'Tournaments Played'.tr,
            ),
            const SizedBox(width: 1),
            UserStatsTile(
              gradient: kTourWonGradient,
              value: '$tournamentWon',
              title: 'Tournaments Won'.tr,
            ),
            const SizedBox(width: 1),
            UserStatsTile(
              gradient: kWinPercentGradient,
              value: '$winningPercentage%',
              title: 'Winning Percentage'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

class UserStatsTile extends StatelessWidget {
  final Gradient gradient;
  final String value;
  final String title;

  const UserStatsTile({
    Key? key,
    required this.gradient,
    required this.value,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      padding: const EdgeInsets.all(kDefaultMargin / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            value.padLeft(2, '0'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: kDefaultMargin,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ));
  }
}
