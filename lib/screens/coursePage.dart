import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/course_controller.dart';
import 'package:learny/styles/style.dart';

class CoursePage extends StatelessWidget {
  CoursePage({super.key});

  final courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {

    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar1('Courses'),
      body: SingleChildScrollView(
        child: Column(
          children: [

            GetX<CourseController>(
              builder: (controller){
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.courses.length,
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
                                        child: Image.network("http://10.0.2.2:4000/${controller.courses[index].courseImage}",
                                          height: Height*0.15, width: Width,fit: BoxFit.cover,)
                                    ),
                                    const SizedBox(height: 5,),
                                    Center(
                                      child: Text(controller.courses[index].title, style: TextHeader2(),),
                                    ),
                                    const SizedBox(height: 5,),
                                    // Text(controller.courses[index].description, style: SmallBoldText(),),
                                    const SizedBox(height: 10,),
                                    Container(
                                      width: Width,
                                      height: 35,

                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Text('Enroll Now', style: TextColorHeader3(colorWhite),),
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    InkWell(
                                      onTap: (){
                                        Get.toNamed('/courseInside', arguments: {'data':controller.courses[index]});
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

      bottomNavigationBar: CustomBottomNavigation(3),
    );
  }
}
