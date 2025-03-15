import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../styles/style.dart';
import 'package:http/http.dart' as http;

class UpdateProfileController extends GetxController{
  final ImagePicker picker = ImagePicker();
  late XFile? image;
  final imagePath = ''.obs;
  final RxMap profile = {"name":"",'phone':'', "education":'',"language":'','location':'',
    'facebook':'','instagram':'','linkedin':'','github':''}.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchProfile();
  }

  void FetchProfile() async {

    var token = GetStorage().read('token');
    var url = 'http://10.0.2.2:4000/api/profile';
    var response = await http.get(Uri.parse(url), headers: {'Content-Type':'application/json', 'Authorization':'Bearer ${token}'});

    print('Profile data - ${jsonDecode(response.body)["profile"]}');

    if (response.statusCode == 200){
      var data = jsonDecode(response.body)['profile'];

      profile['name'] = data['name']?? "";
      profile['phone'] = data['phone'] ?? "";
      profile['education'] = data['education'] ?? '';
      profile['location'] = data['location'] ?? '';
      profile['language'] = data['language'] ?? '';
      profile['facebook'] = data['facebook'] ?? '';
      profile['instagram'] = data['instagram'] ?? '';
      profile['linkedin'] = data['linkedin'] ?? '';
      profile['github'] = data['github'] ?? '';


      print("Profile after update - ${profile}");


    }

  }


  void selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null){
      imagePath.value = image!.path;
    }
    else {
      Get.snackbar(
          'Hello',
          'World',
          titleText: Text('Error !', style: NormalText(),),
          messageText: Text('No Image selected !', style: TextHeader3(),),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: double.infinity,
          backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
          borderRadius: 0

      );
    }

  }

  void uploadProfile() async {
    print('====1===');

    var formData = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:4000/api/profile'));

    if (imagePath.value == '') {
      formData.fields.addAll({
        'name': profile['name']!,
        'phone': profile['phone']!,
        'education': profile['education']!,
        'language': profile['language']!,
        'location': profile['location']!,
        'facebook': profile['facebook']!,
        'instagram': profile['instagram']!,
        'linkedin': profile['linkedin']!,
        'github': profile['github']!,
      });
    } else {
      formData.fields.addAll({
        'name': profile['name']!,
        'phone': profile['phone']!,
        'education': profile['education']!,
        'language': profile['language']!,
        'location': profile['location']!,
        'facebook': profile['facebook']!,
        'instagram': profile['instagram']!,
        'linkedin': profile['linkedin']!,
        'github': profile['github']!,
      });


      var file = await http.MultipartFile.fromPath(
        'file',
        imagePath.value,
        filename: '${GetStorage().read('username')} - ${DateTime.now().microsecondsSinceEpoch}.jpg',
      );
      formData.files.add(file);
    }
    print('====2===${profile}');
    print('====3===');

    formData.headers.addAll({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read('token')}'
    });
    print('====4===');
    try {

      print('====5===');
      var response = await formData.send();
      if (response.statusCode == 200) {
        Get.offAllNamed('/myprofile');

        Get.snackbar(
          'Hello',
          'World',
          titleText: Text(
            'Success !',
            style: NormalText(),
          ),
          messageText: Text(
            'Profile has been updated !',
            style: TextHeader3(),
          ),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: double.infinity,
          backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
          borderRadius: 0,
        );
        profile.value = {"name":"",'phone':'', "education":'',"language":'','location':'',
          'facebook':'','instagram':'','linkedin':'','github':''};

        imagePath.value = '';


      } else {
        print('====6===');
        Get.snackbar(
          'Hello',
          'World',
          titleText: Text(
            'Error !',
            style: NormalText(),
          ),
          messageText: Text(
            'Profile was not updated !',
            style: TextHeader3(),
          ),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: double.infinity,
          backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
          borderRadius: 0,
        );
      }
    } catch (e) {
      print('====7===');
      print('Error uploading image: $e');
      // Handle error here
    }
  }



}