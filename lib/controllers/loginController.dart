import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profileModel.dart';
import '../styles/style.dart';

class LoginController extends GetxController {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var user = User(name: '', username: '', email: '', token: '', role: '', createdAt: '').obs;

  var profile = Profile(education: '',linkedin: '',  id: '', userId: '', name: '', createdAt: '',
      updatedAt: '', facebook: '', github: '', instagram: '', language: '', location: '',
      phone: '', profilePic: '').obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> LoginRequest () async{
    try {
      var headers = {'Content-Type':'application/json'};
      var loginUrl = 'http://10.0.2.2:4000/api/user/login';

      Map<String, String> requestBody = {
        'username':usernameController.text,
        'password': passwordController.text
      };

      var response = await http.post(Uri.parse(loginUrl), headers: headers, body: jsonEncode(requestBody));

      print(response);
      print(jsonDecode(response.body));

      if (response.statusCode == 200){
        var data = jsonDecode(response.body);
        var token = data['token'];
        print('=======1');

        GetStorage().write('userId', data['id']);
        GetStorage().write('token', token);
        GetStorage().write('email', data['email']);
        GetStorage().write('username', data['username']);
        GetStorage().write('name', data['name']);
        GetStorage().write('role', data['role']);
        GetStorage().write('createdAt', data['createdAt']);

        print('====2');
        usernameController.clear();
        passwordController.clear();
        print('======3');

        user.value = User(name: data['name'],
            username: data['username'], email: data['email'],
            token: data['token'], role: data['role'], createdAt: data['createdAt']);

        print('======4');

        await getProfileRequest();
        print('======5');
        print(data);

        print('User - ${user.value}');


        Get.offNamed('/home');

      }
      else {
        var data = jsonDecode(response.body);
        Get.snackbar(
            'Hello',
            'World',
            titleText: Text('Error !', style: TextColorHeader2(colorWhite),),
            messageText: Text(data['error'], style: TextColorHeader3(colorWhite),),
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: double.infinity,
            backgroundColor: const Color.fromRGBO(255, 64, 137, 1),
            colorText: const Color.fromRGBO(1, 1, 1, 1),
            borderRadius: 0

        );
      }
    }
    catch(e){
      Get.snackbar(
          'Hello',
          'World',
          titleText: Text('Error !', style: NormalText(),),
          messageText: Text('invalid credentials !', style: TextHeader3(),),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: double.infinity,
          backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
          borderRadius: 0

      );
    }


  }

  Future<void> getProfileRequest() async {
    //var prefs = await _prefs;
    //var token = prefs.getString('token');
    var token = GetStorage().read('token');

    var profileUrl = 'http://10.0.2.2:4000/api/profile';

    print('Hello World - $token');

    if (token != null && token != '') {
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var resonse = await http.get(Uri.parse(profileUrl), headers: header);


      if (resonse.statusCode == 200) {
        var data = jsonDecode(resonse.body)['profile'];

        print(data);

        profile.value = Profile(
            education: data['education'] ?? '',
            linkedin: data['linkedin'] ?? '',
            id: data['_id'],
            userId: data['userId'],
            name: data['name'],
            createdAt: data['createdAt'],
            updatedAt: data['updatedAt'],
            facebook: data['facebook'] ?? '',
            github: data['github'],
            instagram: data['instagram'] ?? '',
            language: data['language'] ?? '',
            location: data['location']?? '',
            phone: data['phone']?? '',
            profilePic: data['profilePic']?? '' );



      }



      else {
        print('Authentication required');
      }
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    print('Token - ${GetStorage().read('token')}');

    if (GetStorage().read('token') != '' && GetStorage().read('token') != null){
      await getProfileRequest();
    }



  }

  void Logout() async {


    final prefs = await _prefs;
    prefs.remove('token');

    GetStorage().erase();

    user.value = User(name: '', username: '', email: '', token: '', role: '', createdAt: '');
    profile.value = Profile(education: '',linkedin: '', id: '', userId: '', name: '', createdAt: '',
        updatedAt: '', facebook: '', github: '', instagram: '', language: '', location: '',
        phone: '', profilePic: '');

    Get.offAllNamed('/home');
  }





}