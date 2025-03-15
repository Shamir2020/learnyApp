import 'package:shared_preferences/shared_preferences.dart';


Future<bool> LoginStatus() async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.get('token');

  if (token != null && token != ''){
    return true;
  }
  else {
    return false;
  }

}