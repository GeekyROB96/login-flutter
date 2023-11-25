import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/screens/signup/widget/signup_footer_widget.dart';
import 'package:login_flutter_app/src/features/authentication/screens/signup/widget/signup_form_widget.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: const Column(
              children: [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubtitle,
                  imageHeight: 0.15,
                  titleTextStyle: TextStyle(fontSize: 24.0), // Adjust the font size as needed
                ),

                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}