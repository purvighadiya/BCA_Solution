import 'package:bca_course/Home.dart';
import 'package:bca_course/onboarding.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BCA Course",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Course(),
    );
  }
}
class Course extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:onboarding(),
    );
  }
}
// Center(
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => onboarding(),
// ),
// );
// },
// child: Text('View PDF'),
// ),),