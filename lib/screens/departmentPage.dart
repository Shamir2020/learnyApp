import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/department_controller.dart';
// import 'package:flutter_html/flutter_html.dart';

import '../styles/style.dart';

class DepartmentPage extends StatelessWidget {
  DepartmentPage({super.key});

  final departmentController = Get.put(DepartmentController());

  @override
  Widget build(BuildContext context) {

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar1('Departments'),
      body: SingleChildScrollView(
        child: Column(
          children: [

            GetX<DepartmentController>(
            builder: (controller){
              return ListView.builder(
                  itemCount: controller.departments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index){
                    return InkWell(
                      onTap: (){
                        Get.toNamed('/departmentInside', arguments: {'data':controller.departments[index]});
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,


                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: const Offset(2, 2)
                                  ),
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: const Offset(-2, -2)
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network("http://10.0.2.2:4000/${controller.departments[index].departmentPic}",
                                        height: Height*0.15, width: Width,fit: BoxFit.cover,)
                                  ),
                                  const SizedBox(height: 15,),
                                  Center(
                                    child: Text(controller.departments[index].title, style: TextHeader2(),),
                                  ),
                                  const SizedBox(height: 10,),
                                  // Container(
                                  //   width: Width,
                                  //   height: 35,
                                  //
                                  //   decoration: BoxDecoration(
                                  //       gradient: const LinearGradient(
                                  //           colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                  //       ),
                                  //       borderRadius: BorderRadius.circular(5)
                                  //   ),
                                  //   child: Center(
                                  //     child: Text('7 courses', style: TextColorHeader3(colorWhite),),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          )
                      ),
                    );
                  }
              );
            },
          ),],
        )
      ),

      bottomNavigationBar: CustomBottomNavigation(0),
    );
  }
}

