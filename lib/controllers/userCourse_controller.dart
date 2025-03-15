
import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learny/models/course_model.dart';

class UserCourseController extends GetxController{
  final UserCourses = <Course>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchUserCourses();
  }

  void FetchUserCourses () async {

    String token = GetStorage().read('token');

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    String userId = decodedToken['id'];

    var BaseUrl = 'http://10.0.2.2:4000/api/course/user/$userId';
    var response = await http.get(Uri.parse(BaseUrl));
    if (response.statusCode == 200){

      var data = jsonDecode(response.body)['courses'];

      // print(data);

      data.forEach((course){
        UserCourses.add(Course(id: course['_id'], title: course['title'], description: course['description'],
            courseCode: course['courseCode'], category: course['category'], courseImage: course['courseImage'],
            teachers: course['teachers'], students: course['students'], reviews: course['reviews'],
            enrollRequests: course['enrollRequests']));
      });

      print(UserCourses[0].title);
    }
  }
}