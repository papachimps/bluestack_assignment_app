import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kOrange = Color(0xffFAA634);
const Color kDullWhite = Color(0xffF9F9F9);
const Color kTitleBlack = Color(0xff2D2D32);
const Color kChipBlue = Color(0xff4A6EF6);

const double kDefaultMargin = 24;
const double kAppBarHeight = 64;


final SvgPicture kHamburgerIcon = SvgPicture.asset('assets/hamburger.svg');

const Gradient kTourPlayedGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: <Color>[
    Color(0xffE3AB3B),
    Color(0xffD98931),
  ],
);

const Gradient kTourWonGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: <Color>[
    Color(0xffA062D9),
    Color(0xff8D61B5),
  ],
);

const Gradient kWinPercentGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: <Color>[
    Color(0xffE08259),
    Color(0xffDC634F),
  ],
);

const kTextStyle = TextStyle(color: kTitleBlack);

const kInputTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrange, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kOrange, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kUserTitleTextStyle = TextStyle(
  color: kTitleBlack,
  fontWeight: FontWeight.bold,
  fontSize: kDefaultMargin,
);

final ShapeDecoration kTournamentTileShapeDecoration = ShapeDecoration(
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: 8,
      offset: const Offset(0, 3),
    ),
  ],
  shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(kDefaultMargin * 2)),
);

// const kProfilePicUrl1 = 'https://picsum.photos/id/1005/200';
