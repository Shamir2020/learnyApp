import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryController extends GetxController {
  final categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    const BaseUrl = 'http://10.0.2.2:4000';
    final response = await http.get(Uri.parse('$BaseUrl/api/category'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // Clear existing categories before adding new ones
      categories.clear();

      // Iterate over each category in the data
      data.forEach((cat) {
        // Create a new Category object and add it to the categories list
        categories.add(Category(
          category: cat['category'],
          description: cat['description'],
          categoryImage: cat['categoryImage'],
          courses: List<String>.from(cat['courses']),
        ));
      });
    }
    print(categories);
  }
}
