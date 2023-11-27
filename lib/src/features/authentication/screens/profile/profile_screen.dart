//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:login_flutter_app/src/constants/color.dart';
// import 'package:login_flutter_app/src/constants/image_strings.dart';
// import 'package:login_flutter_app/src/constants/text_strings.dart';
// import 'package:login_flutter_app/src/features/authentication/controllers/profile_controller.dart';
// import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
// import 'package:login_flutter_app/src/features/authentication/screens/profile/profile_widget/profiile_menu_widget.dart';
// import 'package:login_flutter_app/src/features/authentication/screens/profile/update_profile_screen.dart';
// import 'package:login_flutter_app/src/localization/repository/authentication_repository/authentication_repository.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController());
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(LineAwesomeIcons.angle_left),
//         ),
//         title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               FutureBuilder(
//                 future: ProfileController.instance.getUserData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasData) {
//                       UserModel userData = snapshot.data as UserModel;
//                       return Column(
//                         children: [
//                           Stack(
//                             children: [
//                               SizedBox(
//                                 width: 120,
//                                 height: 120,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(100),
//                                   child: const Image(image: AssetImage(tProfileImage)),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 right: 0,
//                                 child: Container(
//                                   width: 35,
//                                   height: 35,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(100),
//                                     color: tPrimaryColor,
//                                   ),
//                                   child: const Icon(
//                                     LineAwesomeIcons.alternate_pencil,
//                                     color: Colors.black,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Text(userData.fullName, style: Theme.of(context).textTheme.headline4),
//                           Text(userData.email, style: Theme.of(context).textTheme.bodyText2),
//                           const SizedBox(height: 20),
//                           SizedBox(
//                             width: 200,
//                             child: ElevatedButton(
//                               onPressed: () => Get.to(() => UpdateProfileScreen(userData: userData)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: tPrimaryColor,
//                                 side: BorderSide.none,
//                                 shape: const StadiumBorder(),
//                               ),
//                               child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           const Divider(),
//                           const SizedBox(height: 10),
//                           // ... (other menu items)
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return Container(child: Text(snapshot.error.toString()));
//                     } else {
//                       return const Center(
//                         child: Text("Something went wrong"),
//                       );
//                     }
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ],
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
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
import 'package:login_flutter_app/src/features/authentication/screens/profile/profile_widget/profiile_menu_widget.dart';
import 'package:login_flutter_app/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:login_flutter_app/src/localization/repository/authentication_repository/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FutureBuilder(
                future: ProfileController.instance.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;
                      return Column(
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
                          const SizedBox(height: 10),
                          Text(userData.fullName, style: Theme.of(context).textTheme.headline4),
                          Text(userData.email, style: Theme.of(context).textTheme.bodyText2),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () => Get.to(() => UpdateProfileScreen(userData: userData)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Divider(),
                          const SizedBox(height: 10),
                          ProfileMenuWidget(
                            title: "Settings",
                            icon: LineAwesomeIcons.cog,
                            onPress: () {
                              // Handle button press
                            },
                          ),
                          ProfileMenuWidget(
                            title: "Billing Details",
                            icon: LineAwesomeIcons.wallet,
                            onPress: () {
                              // Handle button press
                            },
                          ),
                          ProfileMenuWidget(
                            title: "User Management",
                            icon: LineAwesomeIcons.user_check,
                            onPress: () {
                              // Handle button press
                            },
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          ProfileMenuWidget(
                            title: "Information",
                            icon: LineAwesomeIcons.info,
                            onPress: () {
                              // Handle button press
                            },
                          ),
                          ProfileMenuWidget(
                            title: "Logout",
                            icon: LineAwesomeIcons.alternate_sign_out,
                            textColor: Colors.red,
                            endIcon: false,
                            onPress: () {
                              Get.defaultDialog(
                                title: "LOGOUT",
                                titleStyle: const TextStyle(fontSize: 20),
                                content: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Are you sure, you want to Logout?"),
                                ),
                                confirm: Expanded(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        AuthenticationRepository1.instance.logout(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      side: BorderSide.none,
                                    ),
                                    child: const Text("Yes"),
                                  ),
                                ),
                                cancel: OutlinedButton(
                                  onPressed: () => Get.back(),
                                  child: const Text("No"),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Container(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(
                        child: Text("Something went wrong"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
