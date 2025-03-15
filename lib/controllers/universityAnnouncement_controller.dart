import 'dart:convert';

import '../models/universityAnnouncement_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class UniversityAnnouncementController extends GetxController{

  final universityAnnouncements = <UniversityAnnouncement>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchUniversityAnnouncements();
  }
  void FetchUniversityAnnouncements () async {

    const BaseUrl = 'http://10.0.2.2:4000/api/announcement/university';
    var response = await http.get(Uri.parse(BaseUrl));

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);

      universityAnnouncements.clear();

      data.forEach((announcement){
        universityAnnouncements.add(UniversityAnnouncement(title: announcement['title'],
            date: announcement['date'], expiryDate: announcement['expiryDate']));
      });

      print(universityAnnouncements);
    }
  }


}