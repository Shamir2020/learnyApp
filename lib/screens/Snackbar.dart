import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/style.dart';
import '../components/appbar.dart';

class LearnSnackBar extends StatelessWidget {
  const LearnSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar1('Snack bar'),
      body: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              fixedSize: Size(Width*0.8, 35)
          ),
          child: Text('Click me!', style: TextHeader2(),),
          onPressed: (){
            Get.snackbar(
                'Hello',
                'World',
                titleText: Text('Are you sure to delete ?', style: NormalText(),),
                messageText: Text('Yes I am sure to delete', style: TextHeader3(),),
                snackPosition: SnackPosition.BOTTOM,
                maxWidth: Width,
                backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
                borderRadius: 0

            );
          },
        ),
      ),
    );
  }
}
