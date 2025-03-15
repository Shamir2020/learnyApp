import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1('Menu'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            const SizedBox(height: 7,),
            CustomMenuCard(Icons.account_circle, 'My Account', '/myaccount'),
            CustomMenuCard(Icons.dashboard, 'My Dashboard', '/dashboard'),
            CustomMenuCard(Icons.inbox, 'Messenger', ''),
            CustomMenuCard(Icons.golf_course_rounded, 'My Courses', '/yourCourses'),
            CustomMenuCard(Icons.favorite, 'Favorite lectures', ''),
            CustomMenuCard(Icons.announcement, 'My Announcements', ''),
            CustomMenuCard(Icons.person_2, 'My Profile', '/myprofile'),
          ],
        ),
      ),
      
      bottomNavigationBar: CustomBottomNavigation(4),
    );
  }
}


Widget CustomMenuCard(IconData icon, String title, String link) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: ListTile(
        onTap: (){
          Get.toNamed(link);
        },
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.navigate_next),
      ),
    ),
  );
}
