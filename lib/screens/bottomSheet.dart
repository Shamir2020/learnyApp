import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/screens/showDialog.dart';
import 'package:learny/styles/style.dart';
import '../components/appbar.dart';
class GetBottomSheet extends StatelessWidget {
  const GetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar1('Learny'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Width*0.65, 35)
              ),
              child: Text('Click me', style: TextHeader2(),),
              onPressed: (){
                Get.bottomSheet(
                    SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light, color: Colors.black,),
                            title: Text('Light theme', style: BlackBoldText(),),
                            onTap: (){
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.dark_mode, color: Colors.black,),
                            title: Text('Dark theme', style: BlackBoldText(),),
                            onTap: (){
                              Get.changeTheme(ThemeData.dark());
                            },
                          )

                        ],
                      ),
                    ),
                    backgroundColor: Colors.white
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(Width*0.65, 35)
              ),
              child: Text('Go back screen', style: TextHeader2(),),
              onPressed: () {
                Get.back();
              }
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Width*0.65, 35)
                ),
                child: Text('Get off', style: TextHeader2(),),
                onPressed: () {
                  Get.off(const LearnShowDialog());
                }
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Width*0.65, 35)
                ),
                child: Text('Get off All', style: TextHeader2(),),
                onPressed: () {
                  Get.offAll(const LearnShowDialog());
                }
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Width*0.65, 35)
                ),
                child: Text('Pass data next screen', style: TextHeader2(),),
                onPressed: () {
                  Get.to(const LearnShowDialog(), arguments: "This is data passed to next screen");
                }
            ),
          ],
        )
      ),
    );
  }
}
