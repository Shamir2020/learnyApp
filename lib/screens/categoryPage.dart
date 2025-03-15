import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/controllers/category_controller.dart';
import 'package:learny/styles/style.dart';


class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar1('Course Categories'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5,),

            GetX<CategoryController>(
              builder: (controller){
                return (
                    ListView.builder(
                        itemCount: controller.categories.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                     color: Colors.grey.shade300,
                                    spreadRadius: 0,
                                    blurRadius: 3,
                                    offset: const Offset(2, 2)
                                  ),
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: const Offset(-2, -2)
                                  )
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                        child: Image.network("http://10.0.2.2:4000/${controller.categories[index].categoryImage}",
                                          height: Height*0.15, width: Width,fit: BoxFit.cover,)
                                    ),
                                  const SizedBox(height: 5,),
                                  Center(
                                    child: Text(controller.categories[index].category, style: TextHeader2(),),
                                  ),
                                    const SizedBox(height: 5,),
                                    Text(controller.categories[index].description, style: SmallBoldText(),),
                                    const SizedBox(height: 10,),
                                    Container(
                                      width: Width,
                                      height: 35,

                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
                                          ),
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Text('7 courses', style: TextColorHeader3(colorWhite),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          );
                        }
                    )
                );
              },
            )
          ],
        ),
      ),
      
      bottomNavigationBar: CustomBottomNavigation(1),

    );
  }
}
