import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';

import '../controllers/userCourse_controller.dart';
import '../styles/style.dart';
import 'LoginPage.dart';

class YourCourses extends StatelessWidget {
  YourCourses({super.key});

  final userCourses = Get.put(UserCourseController());

  @override
  Widget build(BuildContext context) {
    final role = RxString('');

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;


    if (GetStorage().read('role') != null){
      role.value = GetStorage().read('role');
    }

    return Obx(() {

      if (role.value == '' ){
        return LoginPage();
      }

      else if (role.value == 'student'){
        return Scaffold(
          appBar: AppBar1('Your Courses'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GetX<UserCourseController>(
                    builder: (controller){
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.UserCourses.length,
                          itemBuilder: (BuildContext context, index){
                            return InkWell(
                              onTap: (){

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
                                              child: Image.network("http://10.0.2.2:4000/${controller.UserCourses[index].courseImage}",
                                                height: Height*0.15, width: Width,fit: BoxFit.cover,)
                                          ),
                                          const SizedBox(height: 5,),
                                          Center(
                                            child: Text(controller.UserCourses[index].title, style: TextHeader2(),),
                                          ),
                                          const SizedBox(height: 5,),
                                          // Text(controller.courses[index].description, style: SmallBoldText(),),
                                          const SizedBox(height: 10,),

                                          InkWell(
                                            onTap: (){
                                              Get.toNamed('/courseInside', arguments: {'data':controller.UserCourses[index]});
                                            },
                                            child: Container(
                                              width: Width,
                                              height: 35,

                                              decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                      colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                                  ),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Center(
                                                child: Text('View Course', style: TextColorHeader3(colorWhite),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            );
                          });
                    },
                  )

                ],
              ),
            ),
          ),

          bottomNavigationBar: CustomBottomNavigation(-1),
        );
      }
      else if (role.value == 'teacher'){
        return Scaffold(
          appBar: AppBar1('Dashboard'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  GetX<UserCourseController>(
                    builder: (controller){
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.UserCourses.length,
                          itemBuilder: (BuildContext context, index){
                            return InkWell(
                              onTap: (){

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
                                              child: Image.network("http://10.0.2.2:4000/${controller.UserCourses[index].courseImage}",
                                                height: Height*0.15, width: Width,fit: BoxFit.cover,)
                                          ),
                                          const SizedBox(height: 5,),
                                          Center(
                                            child: Text(controller.UserCourses[index].title, style: TextHeader2(),),
                                          ),
                                          const SizedBox(height: 5,),
                                          // Text(controller.courses[index].description, style: SmallBoldText(),),
                                          const SizedBox(height: 10,),

                                          InkWell(
                                            onTap: (){
                                              Get.toNamed('/courseInside', arguments: {'data':controller.UserCourses[index]});
                                            },
                                            child: Container(
                                              width: Width,
                                              height: 35,

                                              decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                      colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                                  ),
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Center(
                                                child: Text('Manage Course', style: TextColorHeader3(colorWhite),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            );
                          });
                    },
                  )

                ],
              ),
            ),
          ),

          bottomNavigationBar: CustomBottomNavigation(-1),
        );
      }
      else {
        return Scaffold(
          appBar: AppBar1('Dashboard'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${role.value}'s Dashboard", style: TextHeader2(),),
                  Text('Your courses', style: TextHeader2(),)
                ],
              ),
            ),
          ),

          bottomNavigationBar: CustomBottomNavigation(-1),
        );
      }
    });
  }
}
