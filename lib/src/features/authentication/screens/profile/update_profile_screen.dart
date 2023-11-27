// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:login_flutter_app/src/constants/color.dart';
// import 'package:login_flutter_app/src/constants/image_strings.dart';
// import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
//
// import '../../../../constants/text_strings.dart';
// import '../../controllers/profile_controller.dart';
//
// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(LineAwesomeIcons.angle_left),
//         ),
//         title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: FutureBuilder(
//             future: controller.getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   UserModel user = snapshot.data as UserModel;
//
//                   final email = TextEditingController(text: user.email);
//                   final password = TextEditingController(text: user.password);
//                   final fullName = TextEditingController(text: user.fullName);
//                   final phoneNo = TextEditingController(text: user.phoneNo);
//
//                   return Column(
//                     children: [
//                       // -- IMAGE with ICON
//                       Stack(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             height: 120,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: const Image(image: AssetImage(tProfileImage)),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               width: 35,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: tPrimaryColor,
//                               ),
//                               child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//
//                       // -- Form Fields
//                       Form(
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: fullName,
//                              // initialValue: userData.fullName,
//                               decoration: const InputDecoration(
//                                 label: Text("Full Name"),
//                                 prefixIcon: Icon(LineAwesomeIcons.user),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: email,
//                             //  initialValue: userData.email,
//                               decoration: const InputDecoration(
//                                 label: Text("E-Mail"),
//                                 prefixIcon: Icon(LineAwesomeIcons.envelope_1),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: phoneNo,
//                              // initialValue: userData.phoneNo,
//                               decoration: const InputDecoration(
//                                 label: Text("Phone No"),
//                                 prefixIcon: Icon(LineAwesomeIcons.phone),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: password,
//                              // initialValue: userData.password,
//                               obscureText: controller.obscureText.value,
//                               decoration: InputDecoration(
//                                 label: const Text("Password"),
//                                 prefixIcon: const Icon(Icons.fingerprint),
//                                 suffixIcon: IconButton(
//                                   icon: controller.obscureText.value
//                                       ? const Icon(LineAwesomeIcons.eye_slash)
//                                       : const Icon(LineAwesomeIcons.eye),
//                                   onPressed: () {
//                                     // Toggle obscureText using the controller
//                                     controller.toggleObscureText();
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // -- Form Submit Button
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   final user = UserModel(
//                                     email: email.text.trim(),
//                                     password: password.text.trim(),
//                                     fullName: fullName.text.trim(),
//                                     phoneNo: phoneNo.text.trim(),
//                                   );
//
//                                   await controller.updateRecord(user);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: tPrimaryColor,
//                                   side: BorderSide.none,
//                                   shape: const StadiumBorder(),
//                                 ),
//                                 child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // -- Created Date and Delete Button
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text.rich(
//                                   TextSpan(
//                                     text: tJoined,
//                                     style: TextStyle(fontSize: 12),
//                                     children: [
//                                       TextSpan(
//                                         text: tJoinedAt,
//                                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.redAccent.withOpacity(0.1),
//                                     elevation: 0,
//                                     foregroundColor: Colors.red,
//                                     shape: const StadiumBorder(),
//                                     side: BorderSide.none,
//                                   ),
//                                   child: const Text(tDelete),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (snapshot.hasError) {
//                   return Container(child: Text(snapshot.error.toString()));
//                 } else {
//                   return const Center(
//                     child: Text("Something went wrong"),
//                   );
//                 }
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:login_flutter_app/src/constants/color.dart';
// import 'package:login_flutter_app/src/constants/image_strings.dart';
// import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
//
// import '../../../../constants/text_strings.dart';
// import '../../controllers/profile_controller.dart';
//
// class UpdateProfileScreen extends StatelessWidget {
//   const UpdateProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(LineAwesomeIcons.angle_left),
//         ),
//         title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: FutureBuilder(
//             future: controller.getUserData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   UserModel user = snapshot.data as UserModel;
//
//                   final email = TextEditingController(text: user.email);
//                   final password = TextEditingController(text: user.password);
//                   final fullName = TextEditingController(text: user.fullName);
//                   final phoneNo = TextEditingController(text: user.phoneNo);
//
//                   return Column(
//                     children: [
//                       // -- IMAGE with ICON
//                       Stack(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             height: 120,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: const Image(image: AssetImage(tProfileImage)),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               width: 35,
//                               height: 35,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: tPrimaryColor,
//                               ),
//                               child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//
//                       // -- Form Fields
//                       Form(
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: fullName,
//                               decoration: const InputDecoration(
//                                 label: Text("Full Name"),
//                                 prefixIcon: Icon(LineAwesomeIcons.user),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: email,
//                               decoration: const InputDecoration(
//                                 label: Text("E-Mail"),
//                                 prefixIcon: Icon(LineAwesomeIcons.envelope_1),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: phoneNo,
//                               decoration: const InputDecoration(
//                                 label: Text("Phone No"),
//                                 prefixIcon: Icon(LineAwesomeIcons.phone),
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: password,
//                               obscureText: controller.obscureText.value,
//                               decoration: InputDecoration(
//                                 label: const Text("Password"),
//                                 prefixIcon: const Icon(Icons.fingerprint),
//                                 suffixIcon: IconButton(
//                                   icon: controller.obscureText.value
//                                       ? const Icon(LineAwesomeIcons.eye_slash)
//                                       : const Icon(LineAwesomeIcons.eye),
//                                   onPressed: () {
//                                     // Toggle obscureText using the controller
//                                     controller.toggleObscureText();
//                                   },
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // -- Form Submit Button
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   // Get the current user ID from Firebase Authentication
//                                  final userId = FirebaseAuth.instance.currentUser?.uid;
//
//                                   // Create the UserModel with the retrieved user ID
//                                   final user = UserModel(
//                                     id: userId,
//                                     email: email.text.trim(),
//                                     password: password.text.trim(),
//                                     fullName: fullName.text.trim(),
//                                     phoneNo: phoneNo.text.trim(),
//                                   );
//
//                                   // Update the user record
//                                   await controller.updateRecord(user);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: tPrimaryColor,
//                                   side: BorderSide.none,
//                                   shape: const StadiumBorder(),
//                                 ),
//                                 child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//
//                             // -- Created Date and Delete Button
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text.rich(
//                                   TextSpan(
//                                     text: tJoined,
//                                     style: TextStyle(fontSize: 12),
//                                     children: [
//                                       TextSpan(
//                                         text: tJoinedAt,
//                                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.redAccent.withOpacity(0.1),
//                                     elevation: 0,
//                                     foregroundColor: Colors.red,
//                                     shape: const StadiumBorder(),
//                                     side: BorderSide.none,
//                                   ),
//                                   child: const Text(tDelete),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (snapshot.hasError) {
//                   return Container(child: Text(snapshot.error.toString()));
//                 } else {
//                   return const Center(
//                     child: Text("Something went wrong"),
//                   );
//                 }
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_flutter_app/src/constants/color.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';

import '../../../../constants/text_strings.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  final UserModel userData;

  const UpdateProfileScreen({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    final email = TextEditingController(text: userData.email);
    final password = TextEditingController(text: userData.password);
    final fullName = TextEditingController(text: userData.fullName);
    final phoneNo = TextEditingController(text: userData.phoneNo);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tProfileImage)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor,
                      ),
                      child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: fullName,
                      decoration: const InputDecoration(
                        label: Text("Full Name"),
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: email,
                      readOnly: true,
                      decoration: const InputDecoration(
                        label: Text("E-Mail"),
                        prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneNo,
                      decoration: const InputDecoration(
                        label: Text("Phone No"),
                        prefixIcon: Icon(LineAwesomeIcons.phone),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: password,
                      obscureText: controller.obscureText.value,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                          icon: controller.obscureText.value
                              ? const Icon(LineAwesomeIcons.eye_slash)
                              : const Icon(LineAwesomeIcons.eye),
                          onPressed: () {
                            controller.toggleObscureText();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final user = UserModel(
                            id: userData.id,
                            email: email.text.trim(),
                            password: password.text.trim(),
                            fullName: fullName.text.trim(),
                            phoneNo: phoneNo.text.trim(),
                          );

                          await controller.updateRecord(user);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: tJoinedAt,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            side: BorderSide.none,
                          ),
                          child: const Text(tDelete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
