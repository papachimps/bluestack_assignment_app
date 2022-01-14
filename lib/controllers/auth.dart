import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/models/user.dart';
import 'feeds.dart';

class AuthController extends GetxController {
  final _box = GetStorage();
  RxString userId = ''.obs;
  RxString password = ''.obs;
  RxBool showSpinner = false.obs;
  RxBool isInputUserIdValid = false.obs;
  RxBool isInputPasswordValid = false.obs;
  RxBool isSubmitFormPressedYet = false.obs;

  @override
  void onInit() {
    _storeMockUsersToStorage();
    if (hasActiveSession) {
      Get.put(FeedsController());
      debugPrint('init ran');
    }
    super.onInit();
  }

  String get initialRoute => hasActiveSession ? '/home' : '/login';

  void validateAndAuthenticateUser() {
    isSubmitFormPressedYet.value = true;
    showSpinner.value = true;
    Get.closeAllSnackbars();
    // check whether the key exists or not
    if (isInputUserIdValid.isTrue && isInputPasswordValid.isTrue) {
      var _userId = userId.value;
      var _password = password.value;
      if (_box.hasData(_userId)) {
        String _value = _box.read(_userId);
        // match for password : value to authenticate
        if (_value == _password) {
          _box.remove('activeSession');
          _box.write('activeSession', _userId);
          userId.value = _userId;
          // following only runs post authentication; so no worries :D
          Get.put(FeedsController());
          Get.offAllNamed('/home');
        } else {
          Get.snackbar(
            'Error',
            'Authentication failed! Incorrect credentials.',
            duration: const Duration(seconds: 1),
          ).show();
        }
      }
      showSpinner.value = false;
    } else {
      Get.snackbar(
        'Error',
        'Invalid credentials! Please input valid credentials.',
        duration: const Duration(seconds: 1),
      ).show();
    }
  }

  void validateInput() {
    debugPrint('validator called');
    if (userId.value.length >= 3) {
      isInputUserIdValid.value = true;
    } else {
      isInputUserIdValid.value = false;
    }
    if (password.value.length >= 3) {
      isInputPasswordValid.value = true;
    } else {
      isInputPasswordValid.value = false;
    }
  }

  void logOut() {
    _box.remove('activeSession');
    Get.offAllNamed('/login');
  }

  bool get hasActiveSession => _box.hasData('activeSession');

  String get activeSessionUserId => _box.read('activeSession');

  Future<void> _storeMockUsersToStorage() async {
    final box = GetStorage();
    if (!box.hasData(_userId1)) {
      await box.write(_userId1, _password);
      debugPrint('added user-pass 1');
    }
    if (!box.hasData(_userId2)) {
      await box.write(_userId2, _password);
      debugPrint('added user-pass 2');
    }
  }

  User getEitherOfMockUser(String userId) =>
      userId == _userId1 ? _userObject1 : _userObject2;
}



// mock users data
const _userId1 = '9898989898';
const _userId2 = '9876543210';
const _password = "password123";

final _userObject1 = User(
  id: _userId1,
  alias: 'Flyingwolf',
  name: 'Simon Baker',
  profileImgUrl: 'https://picsum.photos/id/1024/200',
  rating: 2250,
  tournamentsPlayed: 34,
  tournamentsWon: 9,
);

final _userObject2 = User(
  id: _userId2,
  alias: 'SwimmingPigeon',
  name: 'Shubham Prakash',
  profileImgUrl: 'https://picsum.photos/id/237/200',
  rating: 3014,
  tournamentsPlayed: 56,
  tournamentsWon: 23,
);
