import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/models/courseContent_model.dart';
import 'package:http/http.dart' as http;
import 'package:learny/models/lecture_model.dart';
class CourseContentController extends GetxController{

  final courseContents = <CourseContent>[].obs;


  void fetchCourseContents (String id) async {

    courseContents.clear();

    var baseUrl = 'http://10.0.2.2:4000/api/courseContent/specific/${id}';

    var response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type':'application/json',
      'Authorization': 'Bearer ${GetStorage().read('token')}'
    });

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      
      print(data);
      data.forEach((content){

        var lectures = [];
        content['lectures'].forEach((lecture){
          lectures.add(Lecture(title: lecture['title'], lectureNumber: lecture['lectureNumber'],
              content: lecture['content'], videoUrl: lecture['videoUrl'], courseContent: lecture['courseContent']));
        });

        courseContents.add(CourseContent(title:  content['title'], lectures: lectures, course: content['course']));
      });

      print(courseContents);




    }

  }


}