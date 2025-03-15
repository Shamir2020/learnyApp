import 'dart:convert';

import 'package:get/get.dart';
import 'package:learny/models/department_model.dart';
import 'package:http/http.dart' as http;

class DepartmentController extends GetxController{
  final departments = <Department>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchData();
  }

  void FetchData () async {
    const BaseUrl = 'http://10.0.2.2:4000/api/department';
    var response = await http.get(Uri.parse(BaseUrl));

    departments.clear();
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);

      data.forEach((department){
       departments.add(Department(department['_id'], department['title'], department['description'],
           department['departmentPic']));
      });

    }

  }

}