import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CustomBottomNavigation (int initialIndex){
  return ConvexAppBar(
    color: Colors.black,
    backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
    // gradient: LinearGradient(
    //   // colors: [Color.fromRGBO(242, 112, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
    //   colors: [Color.fromRGBO(0, 205, 172, 1), Color.fromRGBO(141, 218, 213, 1)]
    // ),
    // activeColor: Color.fromRGBO(0, 255, 213, 1),

    activeColor: const Color.fromRGBO(255, 140, 140, 1),
    style: TabStyle.fixedCircle
    ,
    items: const [
      TabItem(icon: Icon(Icons.apartment), title: 'Dept..', fontFamily: 'Poppins'),
      TabItem(icon: Icon(Icons.category), title: 'Cat..', fontFamily: 'Poppins'),
      TabItem(icon: Icon(Icons.home, color: Colors.white), title: 'Home', fontFamily: 'Poppins'),
      TabItem(icon: Icon(Icons.golf_course), title: 'Course', fontFamily: 'Poppins'),
      TabItem(icon: Icon(Icons.person_2), title: 'Menu', fontFamily: 'Poppins')
    ],
    initialActiveIndex: initialIndex,
    onTap: (int index) => {

      if (index == -1){

      }

      else if (index == 0){
        Get.toNamed('/department')
      }
      else if(index == 2){
        Get.offAllNamed('/')
      }
      else if (index == 1){
        Get.toNamed('/category')
      }
      else if (index == 3){
        Get.toNamed('/course')
          }
      else if (index == 4){
        Get.toNamed('/menu')
            }
    },
  );
}