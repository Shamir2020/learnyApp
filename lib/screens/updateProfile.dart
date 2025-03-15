import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/controllers/updateProfile_controller.dart';
import 'package:learny/models/profileModel.dart';

import '../styles/style.dart';

class UpdateProfile extends StatelessWidget {
  final Profile profile;
  UpdateProfile( {required this.profile, super.key});

  final updateProfileController = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {


    var profile1 = Get.arguments;


    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    final RxString selectedEducation = profile.education.obs;
    var educationList = {
      'Education':'',
      "SSC":"SSC",
      "HSC":"HSC",
      "BSC":"BSC"
    }.obs;

    final RxString selectedLanguage = profile.language.obs;
    var languageList = {
      'Language':'',
      'English':'English',
      'Bengali':'Bengali',
      'French':'French'
    }.obs;

    final RxString selectedLocation = profile.location.obs;
    var locationList = {
      'Location':'',
      'Bangladesh':'Bangladesh',
      'Uganda':'Uganda',
      'Nigeria':'Nigeria'
    }.obs;

    var InputHeight = 42.0;
    double splitHeight = 17;

    return Scaffold(

      appBar: AppBar1('Update your profile'),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Width*0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: InputHeight-5,),
                  TextFormField(
                    initialValue: profile.name,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxHeight: InputHeight
                      ),
                      label: Text('Full Name', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('name', (value2) => value);

                    },
                  ),
                  SizedBox(height: splitHeight,),
                  TextFormField(
                    initialValue: profile.phone,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxHeight: InputHeight
                      ),
                      label: Text('Phone', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('phone', (value2) => value);
                    },
                  ),

                  SizedBox(height: splitHeight,),
                  Obx(() {
                    return Container(
                      height: InputHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: DropdownButton(

                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          underline: Container(),
                          borderRadius: BorderRadius.circular(5),
                          isExpanded: true,
                          value: selectedEducation.value,
                          items: educationList.keys.map((key){
                            return DropdownMenuItem(value: educationList[key], child: Text(key, style: TextHeader3(),));
                          }).toList(),
                          onChanged: (value){
                            selectedEducation.value = value!;
                            updateProfileController.profile.update('education', (value2) => value);
                          }
                      ),
                    );
                  }),
                  SizedBox(height: splitHeight,),
                  Obx((){
                    return Container(
                      height: InputHeight,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: DropdownButton(
                          underline: Container(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isExpanded: true,
                          value: selectedLanguage.value,
                          items: languageList.keys.map((key){
                            return DropdownMenuItem(value: languageList[key], child: Text(key, style: TextHeader3(),));
                          }).toList(),

                          onChanged: (value){
                            selectedLanguage.value = value!;
                            updateProfileController.profile.update('language', (value2) => value);
                          }
                      ),
                    );
                  } ),
                  SizedBox(height: splitHeight,),
                  Obx((){
                    return Container(
                      height: InputHeight,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: DropdownButton(
                          underline: Container(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isExpanded: true,
                          value: selectedLocation.value,
                          items: locationList.keys.map((key){
                            return DropdownMenuItem(value: locationList[key], child: Text(key, style: TextHeader3(),));
                          }).toList(),
                          onChanged: (value){
                            selectedLocation.value = value!;
                            updateProfileController.profile.update('location', (value2) => value);
                          }
                      ),
                    );
                  } ),
                  SizedBox(height: splitHeight,),
                  TextFormField(
                    initialValue: profile.facebook,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxHeight: InputHeight
                      ),
                      label: Text('Facebook link', style: TextHeader3(),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('facebook', (value2) => value);
                    },
                  ),

                  SizedBox(height: splitHeight,),
                  TextFormField(
                    initialValue: profile.instagram,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: InputHeight
                        ),

                        label: Text('Instagram link', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        )

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('instagram', (value2) => value);
                    },
                  ),
                  SizedBox(height: splitHeight,),
                  TextFormField(
                    initialValue: profile.instagram,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: InputHeight
                        ),

                        label: Text('Linkedin link', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        )

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('linkedin', (value2) => value);
                    },
                  ),
                  SizedBox(height: splitHeight,),
                  TextFormField(
                    initialValue: profile.github,
                    decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxHeight: InputHeight
                        ),

                        label: Text('Github link', style: TextHeader3(),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        )

                    ),
                    onChanged: (value){
                      updateProfileController.profile.update('github', (value2) => value);
                    },
                  ),
                  SizedBox(height: splitHeight,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent
                      ),
                      onPressed: (){
                        updateProfileController.selectImage();
                      }, child: Text('Upload image', style: SmallBoldText(),)),
                  Text('Image file path', style: SmallBoldText3(),),

                  const SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: (){
                        updateProfileController.uploadProfile();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Width, 40),
                          backgroundColor: const Color.fromRGBO(0, 255, 213, 1)
                      ),
                      child: Text('Save Profile', style: TextColorHeader3(colorBlack),)
                  ),

                ],
              ),
            )
        ),
      )
    );
  }
}
