import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:login_flutter_app/src/features/authentication/screens/dashboard/widgets/dashboard.dart';
import 'package:login_flutter_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey, // Added key to the Form widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                labelText: "Full Name", // Updated label property
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: "E-mail", // Updated label property
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                labelText: "Phone no", // Updated label property
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.password,
              obscureText: true, // Added to hide the password
              decoration: const InputDecoration(
                labelText: "Password", // Updated label property
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // controller.registerUser(
                    //   controller.email.text.trim(),
                    //   controller.password.text.trim(),
                    // );
                    // Get.to(() => const Dash_Board());
                    // Updated navigation



                    final user = UserModel(
                      email : controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim()
                    );
                    SignUpController.instance.createUser(user);
                   // Get.to(()=> const OTPScreen());

                  }
                },
                child: Text("SIGN UP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
