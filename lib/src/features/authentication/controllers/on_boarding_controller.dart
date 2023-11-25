
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';

import '../../../constants/color.dart';
import '../../../constants/image_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boardingscreen/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController{
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: tonBoardingTitle1,
        subTitle: tonBoardingSubTitle1,
        counterText: tonBoardingCounter1,

        bgColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: tOnBoardingTitle2,
        subTitle: tonBoardingSubTitle2,
        counterText: tonBoardingCounter2,

        bgColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: tonBoardingTitle3,
        subTitle: tonBoardingSubTitle3,
        counterText: tonBoardingCounter3,

        bgColor: tOnBoardingPage3Color,
      ),
    ),
  ];

  onPageChangedCallback(int activePageIndex) {

    currentPage.value = activePageIndex;
  }
  animateToNextSlide(){
    int nextPage = controller.currentPage+1;
    controller.animateToPage(page: nextPage);
  }
  skip() =>controller.jumpToPage(page: 2);
}