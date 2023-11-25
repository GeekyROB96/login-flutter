import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/constants/color.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:login_flutter_app/src/features/authentication/screens/on_boardingscreen/on_boarding_screen.dart';// Import the OnBoardingScreen file

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    // Move the delayed navigation inside the build method
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.off(() => OnBoardingScreen());
    });
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            top: splashController.animate.value ? 0 : -30,
            left: splashController.animate.value ? 0 : -30,
            child: Image(image: AssetImage(tSplashTopIcon)),
          ),
          ),
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            top: 80.0,
            left: splashController.animate.value ? tDefaultSize : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: splashController.animate.value ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tAppName, style: Theme.of(context).textTheme.headline3),
                  Text(tAppTagLine, style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ),
          ),
          Positioned(
            bottom: 100,
            child: Image(image: AssetImage(tSplashImage)),
          ),
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            bottom: splashController.animate.value ? tDefaultSize : -80,
            right: tDefaultSize,
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                color: tPrimaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login_flutter_app/src/constants/color.dart';
// import 'package:login_flutter_app/src/constants/image_strings.dart';
// import 'package:login_flutter_app/src/constants/sizes.dart';
// import 'package:login_flutter_app/src/constants/text_strings.dart';
// import 'package:login_flutter_app/src/features/authentication/controllers/splash_screen_controller.dart';
// import 'package:login_flutter_app/src/features/authentication/screens/on_boardingscreen/on_boarding_screen.dart';
// class SplashScreen extends StatelessWidget {
//   SplashScreen({Key? key}) : super(key: key);
//
//   final splashController = Get.put(SplashScreenController());
//
//   @override
//   Widget build(BuildContext context) {
//     splashController.startAnimation();
//
//     // Wait for the animation to complete and then navigate to OnBoardingScreen
//     Future.delayed(Duration(milliseconds: 1500), () {
//       Get.off(() => OnBoardingScreen()); // Use Get.off() to remove the splash screen from the navigation stack
//     });
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Obx(() => AnimatedPositioned(
//             duration: const Duration(milliseconds: 1500),
//             top: splashController.animate.value ? 0 : -30,
//             left: splashController.animate.value ? 0 : -30,
//             child: Image(image: AssetImage(tSplashTopIcon)),
//           ),
//           ),
//           Obx(() => AnimatedPositioned(
//             duration: const Duration(milliseconds: 1500),
//             top: 80.0,
//             left: splashController.animate.value ? tDefaultSize : -80,
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 1600),
//               opacity: splashController.animate.value ? 1 : 0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(tAppName, style: Theme.of(context).textTheme.headline3),
//                   Text(tAppTagLine, style: Theme.of(context).textTheme.headline2),
//                 ],
//               ),
//             ),
//           ),
//           ),
//           Positioned(
//             bottom: 100,
//             child: Image(image: AssetImage(tSplashImage)),
//           ),
//           Obx(() => AnimatedPositioned(
//             duration: const Duration(milliseconds: 1500),
//             bottom: splashController.animate.value ? tDefaultSize : -80,
//             right: tDefaultSize,
//             child: Container(
//               width: tSplashContainerSize,
//               height: tSplashContainerSize,
//               decoration: BoxDecoration( // Provide the color within BoxDecoration
//                 color: tPrimaryColor,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//           ),
//
//
//           ),
//         ],
//       ),
//     );
//   }
// }
