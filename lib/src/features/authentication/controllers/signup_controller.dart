//import 'package:firebase_authentication/firebase_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
import 'package:login_flutter_app/src/features/authentication/screens/dashboard/widgets/dashboard.dart';
import 'package:login_flutter_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:login_flutter_app/src/localization/repository/user_repository/user_repository.dart';
import '../../../localization/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final userRepo = Get.put(UserRepository());
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository1.instance.createUserWithEmailandPassword(email, password);
  }

  // Future<void> createUser(UserModel user) async {
  //   await userRepo.createUser(user);
  //   AuthenticationRepository1.registerUser(email,password);
  //   Get.to(() => const Dash_Board());
  //   //phoneAuthentication(user.phoneNo);
  //   //  Get.to(() => const OTPScreen());
  //
  // }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    await AuthenticationRepository1.instance.createUserWithEmailandPassword(email.text.trim(), password.text.trim());
    Get.to(() => const Dash_Board());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository1.instance.phoneAuthentication(phoneNo);
  }
}