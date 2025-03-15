import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/style.dart';


Widget CustomLinkCard(Width, title, link){
  return InkWell(
    onTap: (){
      Get.toNamed(link);
    },
    child: Container(
      width: Width,
      height: 35,

      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color.fromRGBO(242, 10, 156, 1), Color.fromRGBO(255, 148, 114, 1)]
          ),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Center(
        child: Text(title, style: TextColorHeader3(colorWhite),),
      ),
    ),
  );
}