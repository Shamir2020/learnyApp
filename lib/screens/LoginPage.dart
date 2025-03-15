import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/controllers/loginController.dart';
import 'package:learny/styles/style.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar1('Login'),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Width*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Height*0.18,),
                Text('Learn with learny', style: TextHeader1(),),
                const SizedBox(height: 10,),
                Text('Sign In', style: TextHeader1(),),
                const SizedBox(height: 30,),
                TextFormField(
                  controller: loginController.usernameController,
                  decoration: InputDecoration(
                    constraints: const BoxConstraints(
                      maxHeight: 50
                    ),
                      label: Text('Username', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                ),

                const SizedBox(height: 20,),
                TextFormField(
                  controller: loginController.passwordController,
                  decoration: InputDecoration(
                      constraints: const BoxConstraints(
                        maxHeight: 50
                      ),

                      label: Text('Password', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){

                  },
                  child: Text('Forgot password ?', style: TextHeader2(),),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      loginController.LoginRequest();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Width, 35),
                      backgroundColor: const Color.fromRGBO(0, 255, 213, 1)
                    ),
                    child: Text('Login', style: TextColorHeader3(colorBlack),)
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ? ", style: SmallBoldText(),),
                    InkWell(
                      onTap: (){
                        Get.offAndToNamed('/signup');
                      },
                      child: Text('Create an account', style: TextColorHeader3(Colors.cyanAccent),),
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
