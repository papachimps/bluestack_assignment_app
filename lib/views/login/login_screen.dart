import 'package:bluestack_app/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'custom_round_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: kDefaultMargin),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 10,
                textInputAction: TextInputAction.next,
                decoration: kInputTextFieldDecoration.copyWith(
                  hintText: 'UserID'.tr,
                  errorText: (_authController.isInputUserIdValid.isFalse &&
                          _authController.isSubmitFormPressedYet.isTrue)
                      ? 'Min 3 characters.'.tr
                      : null,
                ),
                onChanged: (_value) {
                  _authController.userId.value = _value;
                  _authController.validateInput();
                },
              ),
              const SizedBox(height: kDefaultMargin / 3),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                maxLength: 11, //password123 is of 11 characters :D
                decoration: kInputTextFieldDecoration.copyWith(
                  hintText: 'Password'.tr,
                  errorText: (_authController.isInputPasswordValid.isFalse &&
                          _authController.isSubmitFormPressedYet.isTrue)
                      ? 'Min 3 characters.'.tr
                      : null,
                ),
                onChanged: (_value) {
                  _authController.password.value = _value;
                  _authController.validateInput();
                },
                onEditingComplete: _authController.validateAndAuthenticateUser,
              ),
              const SizedBox(height: kDefaultMargin),
              CustomRoundedButton(
                text: 'Log In'.tr,
                color: kOrange,
                onPressed: _authController.validateAndAuthenticateUser,
              ),
            ],
          );
        }),
      ),
    );
  }
}
