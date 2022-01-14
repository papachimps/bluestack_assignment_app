import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/auth.dart';
import '/service/translator.dart';

import '/views/login/login_screen.dart';
import '/views/home/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint(Get.deviceLocale.toString());
    final _authController = Get.find<AuthController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: const Locale('ja', 'JP'),
      locale: Get.deviceLocale,
      translations: CustomTranslator(),
      title: 'GameTv Feeds',
      initialRoute: _authController.initialRoute,
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
