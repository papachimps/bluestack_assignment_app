import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/user.dart';
import '/controllers/auth.dart';

import 'widgets/appbar.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = Get.find<AuthController>();
    final User user = _auth.getEitherOfMockUser(_auth.activeSessionUserId);
    return Scaffold(
      appBar: MyAppBar(
        title: user.alias,
        leadingAction: () {
          if (Get.locale == Get.deviceLocale) {
            Get.updateLocale(const Locale('ja', 'JP'));
          } else {
            Get.updateLocale(Get.deviceLocale!);
          }
        },
        trailingAction: _auth.logOut,
      ),
      body: HomeBody(user: user),
    );
  }
}
