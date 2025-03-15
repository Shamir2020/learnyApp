import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:learny/components/appbar.dart';
import '../styles/style.dart';

class LearnShowDialog extends StatelessWidget {
  const LearnShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    
    var arguments = Get.arguments;

    return Scaffold(
      appBar: AppBar1('Show Dialog'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  fixedSize: Size(Width*0.8, 35)
              ),
              child: Text('show Dialog', style: TextHeader2(),),
              onPressed: (){
                Get.defaultDialog(
                  title: 'Alert',
                  titleStyle: TextHeader3(),
                  middleText: 'Are you sure to delete?',
                  middleTextStyle: NormalText(),
                  textCancel: 'No',
                  textConfirm: 'Yes',
                  cancelTextColor: Colors.black,
                  confirmTextColor: Colors.white,
                  onCancel: (){},
                  onConfirm: (){},
                  radius: 4,


                );
              },
            ),
            SizedBox(height: Height*0.1,),
            if (arguments != null) Text(arguments, style: TextHeader2(),)
          ],
        )
      ),
    );
  }
}
