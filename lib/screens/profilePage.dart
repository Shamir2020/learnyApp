import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:learny/screens/updateProfile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/authController.dart';
import 'package:learny/controllers/loginController.dart';
import 'package:learny/screens/LoginPage.dart';
import 'package:learny/styles/style.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final loginController = Get.put(LoginController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;


    return Obx((){

      if (!authController.loginStatus.value){
        return LoginPage();
      }
        return Scaffold(
          appBar: AppBar1('My Profile'),
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
                            CircleAvatar(
                              radius: Width * 0.34,
                              backgroundImage: NetworkImage(
                                  'http://10.0.2.2:4000/${controller.profile
                                      .value.profilePic}'),
                            ),
                            const SizedBox(height: 15,),
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
                                        Get.to(UpdateProfile(profile: controller.profile.value), arguments: controller.profile.value);
                                        // Get.toNamed('/updateProfile', arguments: controller.profile.value);
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