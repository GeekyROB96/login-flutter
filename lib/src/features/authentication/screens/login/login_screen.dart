import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:login_flutter_app/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../localization/repository/authentication_repository/authentication_repository.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);



  void googleSignIn() async {
    try {
      final auth = AuthenticationRepository1.instance;
      var user = await auth.signWithGoogle(); // Assuming signWithGoogle returns a user
      AuthenticationRepository1.instance.setInitialScreen(user as User?);
    } catch (e) {
      Get.snackbar("Oh Snap", e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(tWelcomeScreenImage),
                  height: size.height * 0.2,
                ),
                Text(
                  tLoginTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  tLoginSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                LoginForm(),
                SizedBox(height: 10), // Add spacing
                Align(alignment: Alignment.center,
                    child: const Text("OR")),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      googleSignIn();
                    },
                    icon: Image(
                      image: AssetImage(tGoogleLogoImage),
                      width: 50.0,
                    ),
                    label: Text("Sign With Google"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() =>SignUpScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an Account ",
                        style: Theme.of(context).textTheme.bodyText1,
                        children: const [
                          TextSpan(
                            text: "SignUp",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
