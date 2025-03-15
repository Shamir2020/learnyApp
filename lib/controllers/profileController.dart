import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learny/models/profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

   var profile = Profile(education: '',linkedin: '', id: '', userId: '', name: '', createdAt: '',
       updatedAt: '', facebook: '', github: '', instagram: '', language: '', location: '',
       phone: '', profilePic: '').obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getProfileRequest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var profileUrl = 'http://10.0.2.2:4000/api/profile';

    String? token = prefs.getString('token');


    print('Hello World - $token');

    if (token != null && token != '') {
      var header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var resonse = await http.get(Uri.parse(profileUrl), headers: header);


      if (resonse.statusCode == 200) {
        var data = jsonDecode(resonse.body)['profile'];

        profile.value = Profile(
            education: data['education'],
            linkedin: data['linkedin'],
            id: data['_id'],
            userId: data['userId'],
            name: data['name'],
            createdAt: data['createdAt'],
            updatedAt: data['updatedAt'],
            facebook: data['facebook'],
            github: data['github'],
            instagram: data['instagram'],
            language: data['language'],
            location: data['location'],
            phone: data['phone'],
            profilePic: data['profilePic']);
      }
      else {
        print('Authentication required');
      }
    }
  }
}