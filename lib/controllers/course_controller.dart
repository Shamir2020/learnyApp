
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learny/models/course_model.dart';

class CourseController extends GetxController{
  final courses = <Course>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchAllCourses();
  }

  void FetchAllCourses () async {
    const BaseUrl = 'http://10.0.2.2:4000/api/course';
    var response = await http.get(Uri.parse(BaseUrl));
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);

      data.forEach((course){
        courses.add(Course(id: course['_id'], title: course['title'], description: course['description'],
            courseCode: course['courseCode'], category: course['category'], courseImage: course['courseImage'],
            teachers: course['teachers'], students: course['students'], reviews: course['reviews'],
            enrollRequests: course['enrollRequests']));
      });
    }
  }
}