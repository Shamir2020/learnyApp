import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  final loginStatus = RxBool(false);
  final role = RxString('');

  void isAuthenticated(){
   if (GetStorage().read('token') == null){
     loginStatus.value = false;
   }
   else {
     loginStatus.value = true;
   }
  }
  void userRole(){
    if (GetStorage().read('role') == null){
      role.value = '';
    }
    else {
      role.value = GetStorage().read('role');
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isAuthenticated();
  }

}