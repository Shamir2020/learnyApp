import 'package:flutter/material.dart';
import 'package:learny/components/appbar.dart';
import 'package:learny/components/bottomNavigation.dart';
import 'package:learny/styles/style.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    var Height = MediaQuery.of(context).size.height;
    var Width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar1('Contact Us'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/map.jpeg', height: Height*0.35, width: Width, fit: BoxFit.cover,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Width*0.05, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 255, 213, 1),
                  borderRadius: BorderRadius.circular(7)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    fixedSize: const Size(50, 50),
                                    shape: const CircleBorder()
                                )
                                ,
                                child: const Icon(Icons.call)
                            ),
                            const SizedBox(height: 5,),
                            Text('Call', style: SmallBoldText(),)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                                fixedSize: const Size(50, 50),
                                shape: const CircleBorder()
                              )
                              ,
                              child: const Icon(Icons.message)
                          ),
                          const SizedBox(height: 5,),
                          Text('Support', style: SmallBoldText(),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent,
                                  fixedSize: const Size(50, 50),
                                  shape: const CircleBorder()
                              )
                              ,
                              child: const Icon(Icons.location_on, color: Colors.black,)
                          ),
                          const SizedBox(height: 5,),
                          Text('Maps', style: SmallBoldText(),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  fixedSize: const Size(50, 50),
                                  shape: const CircleBorder()
                              )
                              ,
                              child: const Icon(Icons.facebook_outlined)
                          ),
                          const SizedBox(height: 5,),
                          Text('Facebook', style: SmallBoldText(),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address',style: TextColorHeader3(Colors.black87),),
                            const Text('House B (3rd floor), Road 14'),
                            const Text('Kawla, Dhaka - 1229')
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.email),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',style: TextColorHeader3(Colors.black87),),
                            const Text('shamirroy49@gmail.com'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.call),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone',style: TextColorHeader3(Colors.black87),),
                            const Text('+8801980040729'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      
      bottomNavigationBar: CustomBottomNavigation(-1),
    );
    
  }
}
