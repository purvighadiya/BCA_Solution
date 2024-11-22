import 'package:bca_course/book.dart';
import 'package:bca_course/syllabus.dart';
import 'package:bca_course/university_paper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Home Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
          body: Container(
            color: Colors.pink[800],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => sem()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[800],
                      ),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child:Center(child: Text("University Paper",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => syllabus()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[800],
                      ),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      width: double.infinity,

                      child:Center(child: Text("Syllabus",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Book()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[800],
                      ),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child:Center(child: Text("E-Books",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  )

                ],
              ),
                ),
          ),
    );
  }
}