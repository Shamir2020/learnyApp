import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/category_controller.dart';
import 'package:learny/controllers/course_controller.dart';
import 'package:learny/controllers/profileController.dart';
import 'package:learny/controllers/universityAnnouncement_controller.dart';
import 'package:learny/styles/style.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/loginController.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});
  final categoryController = Get.put(CategoryController());
  final universityAnnouncementController = Get.put(UniversityAnnouncementController());
  final courseController = Get.put(CourseController());
  final profileController = Get.put(ProfileController());
  final loginController = Get.put(LoginController());

  final BaseImageUrl = 'http://10.0.2.2:4000';



  @override
  Widget build(BuildContext context) {

    final token = RxString('');
    final email = RxString('');

    if (GetStorage().read('token') != null){
      token.value = GetStorage().read('token');
      print('Token Home - ${token.value}');
      loginController.getProfileRequest();
      email.value = GetStorage().read('email');
    }

    String LimitChars(String value){
      
      return value.substring(0,100);
    }


    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    Map HomeCardRow1Info = {
      'FAQs':'question-mark.png',
      'Course':'elearning.png',
      'Teacher':'teacher.png',
      'Department':'office.png'
    };


    return Scaffold(
      appBar: AppBarHome('Learny'),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
                children: [
                    Obx((){
                      if (token.value != ''){
                        return UserAccountsDrawerHeader(
                            arrowColor: Colors.black,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 255, 213, 1),

                            ),
                            currentAccountPicture: CircleAvatar(
                              radius: 200,
                              backgroundImage: NetworkImage('http://10.0.2.2:4000/${loginController.profile.value.profilePic}'),
                            ),
                            accountName: Text(loginController.profile.value.name, style: TextColorHeader2(Colors.black),),
                            accountEmail: Text(email.value, style: SmallBoldColorText(colorBlack),)
                        );
                      }else {
                        return UserAccountsDrawerHeader(
                            decoration: const BoxDecoration(
                                color: Colors.white
                            ),
                            accountName: Text('Learny', style: BigHeader(colorBlack),), accountEmail: const Text('')
                        );
                      }
                    }
                    ),

                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Home', style: NormalBoldText(),),
                    onTap: (){
                      Get.offAndToNamed('/home');
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.call),
                    title: Text('Contact Us', style: NormalBoldText(),),
                    onTap: (){
                      Get.toNamed('/contact');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: Text('Terms & conditions', style: NormalBoldText(),),
                    onTap: (){
                      Get.toNamed('/termsConditions');
                    },
                  ),
                  Obx(() {
                    if (token != ""){
                      return  ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text('Logout', style: NormalBoldText(),),
                        onTap: (){
                          loginController.Logout();
                        },
                      );
                    }
                    else {
                      return ListTile(
                        leading: const Icon(Icons.login),
                        title: Text('Sign In', style: NormalBoldText(),),
                        onTap: (){
                          Get.toNamed('/signin');
                        },
                      );
                    }
                  }),


                ],
              )

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeRow1Card(Width, Height, 'FAQs',HomeCardRow1Info['FAQs'], ''),
                  HomeRow1Card(Width, Height, 'Course', HomeCardRow1Info['Course'], '/course'),
                  HomeRow1Card(Width, Height, 'Teacher', HomeCardRow1Info['Teacher'], ''),
                  HomeRow1Card(Width, Height, 'Department', HomeCardRow1Info['Department'], '/department')
                ],
              ),
            ),
            Text('Learn with excellence', style: TextHeader1(),),
            const SizedBox(height: 10,),
            CarouselSlider(
                items: [
                  Slider1Card(Width, 'assets/images/slider1.webp'),
                  Slider1Card(Width, 'assets/images/slider2.jpg'),
                  Slider1Card(Width, 'assets/images/slider3.jpg'),
                  Slider1Card(Width, 'assets/images/slider4.jpeg'),
                ],
                options: CarouselOptions(
                  height: Height*0.3,
                  aspectRatio: 16/9,
                  viewportFraction: .95,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: const RadialGradient(
                  colors: [Color.fromRGBO(0, 255, 213, 1),Color.fromRGBO(0, 256, 204, 1)]
                )
              ),
              width: Width*0.95,


              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Width*0.05, vertical: Height*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Featured Courses', style: TextColorHeader3(Colors.white),),
                        Text('Enroll now', style: TextColorHeader3(Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Width*0.04, vertical: Height*0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Courses', style: TextColorHeader3(colorWhite),),
                        Text('See all', style: TextColorHeader3(colorWhite),),

                      ],
                    ),
                  ),
                 GetX<CourseController>(
                   builder: (controller){
                     return SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Padding(
                           padding: EdgeInsets.symmetric(horizontal: Width*0.04, vertical: 0),
                           child: Row(
                               children: List.generate(controller.courses.length, (index){
                                 return Padding(
                                   padding: EdgeInsets.only(right: Width*0.02),
                                   child: Container(
                                     width: Width*0.35,
                                     height: 220,

                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(4)
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(10),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           SizedBox(
                                             width: Width*0.3,
                                             height: 80,
                                             child: Image.network('$BaseImageUrl/${controller.courses[index].courseImage}', fit: BoxFit.cover,),
                                           ),
                                           Text(controller.courses[index].title, style: SmallBoldText2(),),
                                           const SizedBox(height: 5,),
                                           Text(controller.courses[index].courseCode, style: SmallBoldText3(),),
                                           const SizedBox(height: 5,),
                                           Container(
                                               width: Width*0.3,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(8),
                                                   gradient: const LinearGradient(
                                                       colors: [Color.fromRGBO(242, 112, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                                   )
                                               ),
                                               child: Center(
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(6.0),
                                                   child: Text('Enroll now', style: SmallBoldColorText2(colorWhite),),
                                                 ),
                                               )
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                 );
                               })

                           ),
                         )
                     );
                   },
                 ),
                  const SizedBox(height: 10,)
                ],
              ),
            ),

            const SizedBox(height: 10,),

            GetX<CategoryController>(
              builder: (contoller) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: const LinearGradient(
                          colors: [Color.fromRGBO(0, 200, 200, 1),Color.fromRGBO(0, 200, 190, 1)]
                      )
                  ),
                  width: Width*0.95,

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Width*0.05, vertical: Height*0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Featured Categories', style: TextColorHeader3(Colors.white),),
                            Text('Enroll now', style: TextColorHeader3(Colors.white),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Width*0.04, vertical: Height*0.005),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Categories', style: TextColorHeader3(colorWhite),),
                            Text('See all', style: TextColorHeader3(colorWhite),),

                          ],
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: Width*0.04, vertical: 0),
                            child: Row(
                                children: List.generate(contoller.categories.length, (index){
                                  return Padding(
                                    padding: EdgeInsets.only(right: Width*0.02),
                                    child: Container(
                                      width: Width*0.35,
                                      height: 320,

                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: Width*0.3,
                                              height: 90,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
                                                child: Image.network('http://10.0.2.2:4000/${contoller.categories[index].categoryImage}', fit: BoxFit.cover,),
                                              ),
                                            ),
                                            Text(contoller.categories[index].category, style: SmallBoldText(),),
                                            const SizedBox(height: 5,),
                                            Text(LimitChars(contoller.categories[index].description), style: SmallBoldText2(),),
                                            const SizedBox(height: 5,),
                                            Container(
                                                width: Width*0.3,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    gradient: const LinearGradient(
                                                        colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                                    )
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(6.0),
                                                    child: Text('5 courses', style: SmallBoldColorText2(colorWhite),),
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })

                            ),
                          )
                      ),
                      const SizedBox(height: 10,)
                    ],
                  ),
                );
              }
            ),
            const SizedBox(height: 10,),
            GetX<UniversityAnnouncementController>(
                builder: (contoller) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                            colors: [Color.fromRGBO(0, 200, 200, 1),Color.fromRGBO(0, 200, 190, 1)]
                        )
                    ),
                    width: Width*0.95,

                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Width*0.05, vertical: Height*0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Annnouncement', style: TextColorHeader3(Colors.white),),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Width*0.00, vertical: 0),
                              child: Column(
                                  children: List.generate(contoller.universityAnnouncements.length, (index){
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Container(

                                        height: 100,

                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(4)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(contoller.universityAnnouncements[index].title, style: SmallBoldText(),),
                                              const SizedBox(height: 5,),
                                              Container(
                                                  width: Width*.825,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      gradient: const LinearGradient(
                                                          colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                                      )
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Text(contoller.universityAnnouncements[index].date, style: SmallBoldColorText2(colorWhite),),
                                                    ),
                                                  )
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })

                              ),
                            )
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  );
                }
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(2)

    );
  }
}

Widget HomeRow1Card(Width, Height, title, imageUrl, link){
  return InkWell(
    onTap: (){
      Get.toNamed(link);
    },
    child: Padding(
      padding: EdgeInsets.all(Width*0.015),
      child: Column(
        children: [
          Container(
            height: Width*0.20,
            width: Width*0.20,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Image.asset('assets/images/$imageUrl',),
          ),
          Text(title, style: SmallBoldText(),)
        ],
      ),
    ),
  );
}

Widget Slider1Card(Width, imageUrl){
  return ClipRRect(
    borderRadius: BorderRadius.circular(7),
    child: SizedBox(
      width: Width,
      child: Image.asset('$imageUrl',fit: BoxFit.cover,),
    ),
  );
}

// Widget CustomFancyBottomBar(){
//   return FancyBottomNavigationPlus(
//       circleColor: Colors.greenAccent,
//       tabs: [
//         TabData(icon: const Icon(Icons.apartment), title: 'Department'),
//         TabData(icon: const Icon(Icons.category), title: 'Categories'),
//         TabData(icon: const Icon(Icons.home), title: 'Home'),
//         TabData(icon: const Icon(Icons.golf_course), title: 'Course'),
//         TabData(icon: const Icon(Icons.person_2), title: 'Teacher')
//
//       ], onTabChangedListener: (index){
//
//   });
// }

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final categoryController = Get.put(CategoryController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar1(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text('Welcome to Flutter Getx tutorial App', style: TextHeader1(),),),
//           ElevatedButton(onPressed: (){
//             Get.toNamed('/bottomSheet');
//           }, child: Text('bottomSheet page', style: TextHeader3(),)),
//           ElevatedButton(onPressed: (){
//             Get.toNamed('/routeNavigation');
//           }, child: Text('Route navigation page', style: TextHeader3(),)),
//           ElevatedButton(onPressed: (){
//             Get.toNamed('/showDialog');
//           }, child: Text('show dialog page', style: TextHeader3(),)),
//           ElevatedButton(onPressed: (){
//             Get.toNamed('/snackBar');
//           }, child: Text('Snack bar page', style: TextHeader3(),)),
//           ElevatedButton(onPressed: (){
//             Get.toNamed('/reactiveState');
//           }, child: Text('Reactive State Management', style: TextHeader3(),))
//         ],
//       ),
//     );
//   }
// }
