import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/screens/bottomSheet.dart';
import 'package:learny/styles/style.dart';

class RouteNavigation extends StatelessWidget {
  const RouteNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1('Route navigation'),
      body: Center(
        child: ElevatedButton(
          child: Text('Navigate next page', style: TextHeader2(),),
          onPressed: (){
            Get.to(
              const GetBottomSheet()
            );
          },
        ),
      ),
    );
  }
}
