import 'package:flutter/material.dart';
import 'package:learny/screens/LoginPage.dart';
import 'package:learny/screens/ReactiveState.dart';
import 'package:learny/screens/accountPage.dart';
import 'package:learny/screens/categoryPage.dart';
import 'package:learny/screens/contactPage.dart';
import 'package:learny/screens/courseInside.dart';
import 'package:learny/screens/coursePage.dart';
import 'package:learny/screens/dashboard.dart';
import 'package:learny/screens/departmentInside.dart';
import 'package:learny/screens/departmentPage.dart';
import 'package:learny/screens/home.dart';
import 'package:learny/screens/menuPage.dart';
import 'package:learny/screens/profilePage.dart';
import 'package:learny/screens/registerPage.dart';
import 'package:learny/screens/routeNavigation.dart';
import 'package:learny/screens/showDialog.dart';
import 'package:learny/screens/termsConditions.dart';
import 'package:learny/screens/updateProfile.dart';
import 'package:learny/screens/yourCourses.dart';
import 'screens/Snackbar.dart';
import 'package:get/get.dart';
import 'screens/bottomSheet.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  GetStorage.init();
  runApp(const Learny());
}

class Learny extends StatelessWidget {
  const Learny({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> HomePage()),
        GetPage(name: '/showDialog', page: ()=>const LearnShowDialog()),
        GetPage(name: '/bottomSheet', page: ()=> const GetBottomSheet()),
        GetPage(name: '/routeNavigation', page: ()=> const RouteNavigation()),
        GetPage(name: '/snackBar', page: ()=> const LearnSnackBar()),
        GetPage(name: '/reactiveState', page: ()=>const ReactiveStateManagement()),
        // Routes
        GetPage(name: '/signin', page: ()=> LoginPage()),
        GetPage(name: '/signup', page: ()=> const RegisterPage()),
        GetPage(name: '/category', page: ()=> CategoryPage()),
        GetPage(name: '/course', page: ()=> CoursePage()),
        GetPage(name: '/department', page: ()=>DepartmentPage()),
        GetPage(name: '/menu', page: ()=>const MenuPage()),
        GetPage(name: '/departmentInside', page: ()=> DepartmentInsidePage()),
        GetPage(name: '/contact', page: ()=> const ContactPage()),
        GetPage(name: '/termsConditions', page: ()=> const TermsConditions()),
        GetPage(name: '/courseInside', page: ()=> CourseInsidePage()),
        GetPage(name: '/myprofile', page: ()=> MyProfile()),
        GetPage(name: '/myaccount', page: ()=> AccountPage()),

        GetPage(name: '/dashboard', page: ()=> DashboardPage()),
        GetPage(name: '/yourCourses', page: ()=> YourCourses()),
        // GetPage(name: '/updateProfile', page: ()=> UpdateProfile())

      ],
      debugShowCheckedModeBanner: false,
    );
  }
}


