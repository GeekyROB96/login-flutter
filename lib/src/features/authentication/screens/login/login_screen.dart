import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/screens/login/login_form_widget.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    onPressed: () {},
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
                    onPressed: () {},
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
