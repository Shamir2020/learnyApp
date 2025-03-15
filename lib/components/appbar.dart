import 'package:flutter/material.dart';
import '../styles/style.dart';


AppBar AppBar1 (String titleText){
  return AppBar(
    title: Text(titleText, style: TextHeader3()),
    elevation: 1,
    backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
    foregroundColor: Colors.black,
  );
}

AppBar AppBarHome (String titleText){
  return AppBar(
    title: Text(titleText, style: TextHeader2()),
    elevation: 1,
    backgroundColor: const Color.fromRGBO(0, 255, 213, 1),
    foregroundColor: Colors.black,
  );
}