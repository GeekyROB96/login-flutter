import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_flutter_app/src/constants/color.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../constants/text_strings.dart';
import '../../models/model_on_boarding.dart';
import 'on_boarding_page_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: obcontroller.onPageChangedCallback,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obcontroller.animateToNextSlide(),
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                side: const BorderSide(color: Colors.black26),
              ),
              child: const Icon(Icons.arrow_forward_outlined),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obcontroller.skip(),
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
          ),
          Obx(
                () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
                activeIndex: obcontroller.currentPage.value,
                count: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
