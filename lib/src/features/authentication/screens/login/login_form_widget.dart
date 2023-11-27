import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:login_flutter_app/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:login_flutter_app/src/features/authentication/screens/dashboard/widgets/dashboard.dart';

import '../../../../localization/repository/authentication_repository/authentication_repository.dart';

class LoginForm extends StatelessWidget {
    LoginForm({
    Key? key,
  }) : super(key: key);

  final AuthenticationRepository1 authRepository = AuthenticationRepository1.instance;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  void signIn(String email, String password) async {
    try {
      await authRepository.loginWithEmailandPassword(email, password);
      // If login is successful, navigate to the dashboard
      Get.offAll(() => const Dash_Board());
    } catch (e) {
      // Handle login failure, show error message or perform any other actions
      print("Login failed: $e");
    }
  }



    @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Enter your Email",
                hintText: "EMAIL",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              width: 30.0,
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true, // Hide the password
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  labelText: "Enter your Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp))),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text("Forgot Password "),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Retrieve email and password from text fields
                  String email = emailController.text.trim(); // Replace with actual value
                  String password = passwordController.text.trim(); // Replace with actual value
                  signIn(email, password);
                },
                child: Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
