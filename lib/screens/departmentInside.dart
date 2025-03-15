import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/models/department_model.dart';
import 'package:learny/styles/style.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DepartmentInsidePage extends StatelessWidget {
  DepartmentInsidePage({super.key});

  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {

    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    Department department = arguments['data'];

    if (arguments != null ){
      department = arguments['data'];
    }

    return Scaffold(
      appBar: AppBar1('Learny'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(department.title, style: TextHeader2(),),
              const SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network('http://10.0.2.2:4000/${department.departmentPic}', height: 0.28*Height, width: Width,fit: BoxFit.cover,),
              ),
              const SizedBox(height: 10,),
              HtmlWidget(department.description, textStyle: TextHeader2(),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(-1),
    );
  }
}
