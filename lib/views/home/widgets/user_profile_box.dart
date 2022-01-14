import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '/views/constants.dart';

class UserProfileBox extends StatelessWidget {
  final String userName;
  final int rating;
  final String profileUrl;

  const UserProfileBox({
    Key? key,
    required this.userName,
    required this.rating,
    required this.profileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: kDefaultMargin * 4.5,
          width: kDefaultMargin * 4.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultMargin * 4.5),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/preloader.gif',
              image: profileUrl,
            ),
          ),
        ),
        const SizedBox(width: kDefaultMargin / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: kDefaultMargin * 8,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Text(
                  userName,
                  style: kUserTitleTextStyle,
                ),
              ),
            ),
            const SizedBox(height: kDefaultMargin),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultMargin,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kDefaultMargin * 2),
                  border: Border.all(color: kChipBlue)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$rating',
                    style: const TextStyle(
                        color: kChipBlue,
                        fontSize: kDefaultMargin,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: kDefaultMargin / 2),
                  Text(
                    'Elo Rating'.tr,
                    style: const TextStyle(
                      color: kChipBlue,
                      fontSize: kDefaultMargin / 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
