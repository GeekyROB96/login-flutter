import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/color.dart';
import 'package:login_flutter_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:login_flutter_app/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;


    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.6),
            Column(
              children: [
                Text(tWelcomeTtile, style: Theme.of(context).textTheme.headline3),
                Text(WelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tSecondaryColor,
                      side: BorderSide(color: tSecondaryColor),
                      padding:  EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
                    child: Text(tLogin.toUpperCase(),
                   ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tSecondaryColor,
                      side: BorderSide(color: tSecondaryColor),
                      padding:  EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}