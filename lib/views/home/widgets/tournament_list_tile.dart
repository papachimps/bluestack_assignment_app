import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/models/feed.dart';
import '/views/constants.dart';

class TournamentListTile extends StatelessWidget {
  final Feed feed;

  const TournamentListTile({
    Key? key,
    required this.feed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('built listTile');
    return Container(
      height: kDefaultMargin * 7,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: kDefaultMargin / 2),
      decoration: kTournamentTileShapeDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: CachedNetworkImage(
              imageUrl: feed.coverUrl,
              placeholder: (context, url) =>
                  Center(child: Image.asset('assets/preloader.gif')),
              width: double.infinity,
              imageBuilder: (context, imageProvider) => Container(
                decoration: ShapeDecoration(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultMargin * 2),
                      topRight: Radius.circular(kDefaultMargin * 2),
                    ),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(kDefaultMargin / 2),
              padding:
                  const EdgeInsetsDirectional.only(end: kDefaultMargin * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    feed.name,
                    overflow: TextOverflow.ellipsis,
                    style: kTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: kDefaultMargin * 2 / 3,
                    ),
                  ),
                  Text(
                    feed.gameName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: kDefaultMargin / 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
