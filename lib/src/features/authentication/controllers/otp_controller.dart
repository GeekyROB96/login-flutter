import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/screens/dashboard/widgets/dashboard.dart';
import 'package:login_flutter_app/src/localization/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository1.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dash_Board()) : Get.back();
  }


}