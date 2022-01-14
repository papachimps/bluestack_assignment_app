import 'package:flutter/material.dart';

import '/views/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback leadingAction;
  final VoidCallback trailingAction;
  const MyAppBar({
    Key? key,
    required this.title,
    required this.leadingAction,
    required this.trailingAction,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDullWhite,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: kTitleBlack),
      ),
      automaticallyImplyLeading: true,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultMargin),
        onPressed: leadingAction,
        icon: kHamburgerIcon,
      ),
      actions: [
        IconButton(
          color: kTitleBlack,
          padding: const EdgeInsets.only(right: kDefaultMargin),
          onPressed: trailingAction,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
