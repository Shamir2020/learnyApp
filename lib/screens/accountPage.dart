import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/controllers/authController.dart';
import 'package:learny/screens/LoginPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/bottomNavigation.dart';
import '../controllers/loginController.dart';
import '../styles/style.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final authController = Get.put(AuthController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Obx(() {

      if (!authController.loginStatus.value){
        return LoginPage();
      }

      return Scaffold(
        appBar: AppBar1('My Account'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetX<LoginController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(7),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15),
                            child: SizedBox(
                              width: Width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10,),
                                  Text('Account Information - ', style: TextHeader2(),),
                                  const SizedBox(height: 8,),
                                  CustomRowProfileCard('Name', GetStorage().read('name')),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Username', GetStorage().read('username')),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Email', GetStorage().read('email')),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Account Type', GetStorage().read('role')),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Created At', GetStorage().read('createdAt')),
                                  const SizedBox(height: 8,),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: Width,
                                      height: 35,

                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    242, 10, 156, 1),
                                                Color.fromRGBO(
                                                    255, 148, 114, 1)
                                              ]
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              5)
                                      ),
                                      child: Center(
                                        child: Text('Delete Account',
                                          style: TextColorHeader3(
                                              colorWhite),),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                ],
                              ),
                            ),
                          ),



                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15),
                            child: SizedBox(
                              width: Width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Profile Information - ',
                                    style: TextHeader2(),),
                                  const SizedBox(height: 8,),
                                  CustomRowProfileCard(
                                      'Name', controller.profile.value.name),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Education',
                                      controller.profile.value.education),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Location',
                                      controller.profile.value.location),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCard('Phone',
                                      controller.profile.value.phone),

                                  const SizedBox(height: 15,),
                                  Text('Socials Links - ',
                                    style: TextHeader2(),),
                                  const SizedBox(height: 8,),
                                  CustomRowProfileCardLink(
                                      'Facebook', controller.profile.value.facebook),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCardLink('Instagram',
                                      controller.profile.value.instagram),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCardLink('Linkedin',
                                      controller.profile.value.location),
                                  const SizedBox(height: 6,),
                                  CustomRowProfileCardLink('Github',
                                      controller.profile.value.github),
                                  const SizedBox(height: 8,),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: Width,
                                      height: 35,

                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    242, 10, 156, 1),
                                                Color.fromRGBO(
                                                    255, 148, 114, 1)
                                              ]
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              5)
                                      ),
                                      child: Center(
                                        child: Text('Update Profile',
                                          style: TextColorHeader3(
                                              colorWhite),),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25,)

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              )

            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation(-1),
      );
    });
  }
}


Widget CustomRowProfileCard(String key,String value){
  return Row(
    children: [
      Text('$key - ', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
      Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
    ],
  );
}

Widget CustomRowProfileCardLink(String key,String link){
  return Row(
    children: [
      Text('$key - ', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
      InkWell(
        onTap: (){
          _launchUrl(link);
        },
        child: Text('Go to $key', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
      )
    ],
  );
}

Future<void> _launchUrl(url) async {
  var url2 = Uri.parse(url);
  if (!await launchUrl(url2)) {
    throw Exception('Could not launch $url');
  }
}