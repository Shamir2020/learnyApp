import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';

import '../styles/style.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    final RxMap<String, dynamic> userTypes = {
      "Select User Type":"Select User Type",
      "Teacher":"teacher",
      "Student":'student'
    }.obs;
    var selectedUserType = 'Select User Type'.obs;

    return Scaffold(
      appBar: AppBar1('Register'),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Width*0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Height*0.08,),
                  Text('Learn with learny', style: TextHeader1(),),
                  const SizedBox(height: 10,),
                  Text('Register now', style: TextHeader1(),),
                  const SizedBox(height: 30,),
                  TextFormField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(
                          maxHeight: 45
                      ),
                      label: Text('Full Name', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: const BoxConstraints(
                            maxHeight: 45
                        ),
                        label: Text('Username', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(
                          maxHeight: 45
                      ),
                      label: Text('Email', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  Obx(() => Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                        underline: Container(),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        borderRadius: BorderRadius.circular(5),
                        isExpanded: true,
                        value: selectedUserType.value,
                        items: userTypes.keys.map((key){
                          return DropdownMenuItem(value: key ,child: Text(userTypes[key], style: TextHeader3(),));
                        }).toList(),
                        onChanged: (value1){
                          selectedUserType.value = value1.toString();
                        }
                    ),
                  ),),

                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: const BoxConstraints(
                            maxHeight: 45
                        ),

                        label: Text('Password', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        )

                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        constraints: const BoxConstraints(
                            maxHeight: 45
                        ),

                        label: Text('Password again', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        )

                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Width, 35),
                          backgroundColor: const Color.fromRGBO(0, 255, 213, 1)
                      ),
                      child: Text('Register', style: TextColorHeader3(colorBlack),)
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ? ", style: SmallBoldText(),),
                      InkWell(
                        onTap: (){
                          Get.offAndToNamed('/signin');
                        },
                        child: Text('Login now', style: TextColorHeader3(Colors.cyanAccent),),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
