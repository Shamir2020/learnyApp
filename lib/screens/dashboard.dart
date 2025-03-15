import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/components/customLinkCard.dart';
import 'package:learny/controllers/userCourse_controller.dart';
import 'package:learny/screens/LoginPage.dart';
import 'package:learny/styles/style.dart';


class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final courseController = Get.put(UserCourseController());

  @override
  Widget build(BuildContext context) {
    final role = RxString('');

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;


    if (GetStorage().read('role') != null){
      role.value = GetStorage().read('role');
    }

    return Obx(() {

      if (role.value == ''){
        return LoginPage();
      }

      else if (role.value == 'student'){
        return Scaffold(
          appBar: AppBar1('Dashboard'),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLinkCard(Width, 'Go to your courses', '/yourCourses')
                ],
              )
            ),
          ),

          bottomNavigationBar: CustomBottomNavigation(-1),
        );
      }
      else if (role.value == 'teacher'){
        return Scaffold(
          appBar: AppBar1('Dashboard'),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomLinkCard(Width, 'Go to your courses', '/yourCourses'),
                    const SizedBox(height: 15,),
                    CustomLinkCard(Width, 'Go to your consultation tracker', ''),

                  ],
                )
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


