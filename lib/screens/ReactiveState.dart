import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/styles/style.dart';


class ReactiveStateManagement extends StatelessWidget {
  const ReactiveStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 0.obs;
    void Increment (){
      value ++;
    }
    return Scaffold(
      appBar: AppBar1('reactive state'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reactive State Management', style: TextHeader2(),),
            const SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              Increment();
            }, child: Text('Increase', style: TextHeader2(),)),
            Obx(() => Text('Value - $value', style: TextHeader1(),)),

          ],
        ),
      )
    );
  }
}
