import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
import 'package:login_flutter_app/src/localization/repository/authentication_repository/authentication_repository.dart';
import 'package:login_flutter_app/src/localization/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{



  static ProfileController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());
  final _authRepo = Get.put(AuthenticationRepository1());
  var obscureText = true.obs;


  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email!=null){
      return _userRepo.getUserDetails(email);
    }
    else{
      Get.snackbar("Error", "Login to continue");
    }

  }

  Future<List<UserModel>> getAllUser() async{
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
  void toggleObscureText() {
    obscureText.toggle();
  }
}