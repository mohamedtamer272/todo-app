import 'package:flutter/material.dart';
import 'package:todo_application/screen/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MyApp',
    initialRoute: HomeScreen.routeName ,
    routes: {HomeScreen.routeName : (c) => HomeScreen()} ,
  ));
}