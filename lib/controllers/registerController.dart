import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController{

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> register() async {
    var headers = {'Content-Type':'application/json'};

    var body = {'name':name.text,'username':username.text,
      'email':email.text,'password1':password1, 'password2':password2 };

    var response = await http.post(Uri.parse('http://10.0.2.2:4000/api/user/register'),
        headers: headers, body: jsonEncode(body));

    


  }


}