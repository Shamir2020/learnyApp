import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/courseContent_controller.dart';
import 'package:learny/models/course_model.dart';
import 'package:learny/styles/style.dart';


class CourseInsidePage extends StatelessWidget {
  CourseInsidePage({super.key});

  final courseContentController = Get.put(CourseContentController());

  @override
  Widget build(BuildContext context) {



    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    var arguments = Get.arguments;

    Course course = arguments['data'];

    courseContentController.fetchCourseContents(course.id);

    RxBool enrolled = RxBool(false);
    
    enrolled.value = course.students.contains(GetStorage().read('userId'));


      return Obx((){
        if (enrolled.value){
          return Scaffold(
            appBar: AppBar1(course.title),
            body: GetX<CourseContentController>(
              builder: (controller){
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.courseContents.length,
                          itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ExpansionTile(
                              collapsedBackgroundColor: const Color.fromRGBO(0, 255, 213, 1),
                              backgroundColor: Colors.cyanAccent,
                              title: Text(controller.courseContents[index].title, style: TextHeader3(),),
                              controlAffinity: ListTileControlAffinity.trailing,
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.courseContents[index].lectures.length,
                                    itemBuilder: (context, index2){
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                                        child: InkWell(
                                          onTap: (){},
                                          child: Text("${controller.courseContents[index].lectures[index2].title} ${controller.courseContents[index].lectures[index2].lectureNumber}", style: TextColorHeader3(colorBlack),),
                                        ),
                                      );
                                })
                              ],
                          ),
                        );
                      })
                    ],
                  ),
                );
              },
            ),
            bottomNavigationBar: CustomBottomNavigation(-1),
          );
        }
        else {
          return Scaffold(
            appBar: AppBar1(course.title),
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [

                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network('http://10.0.2.2:4000/${course.courseImage}', width: Width, height: Height*0.3, fit: BoxFit.cover,)
                      ),
                      const SizedBox(height: 15,),
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
                      HtmlWidget(course.description, textStyle: TextHeader3(),)
                    ],
                  ),
                )
            ),
            bottomNavigationBar: CustomBottomNavigation(-1),
          );
        }
      });



      }
  }
