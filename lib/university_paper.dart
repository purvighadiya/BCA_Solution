import 'package:bca_course/sem1subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class sem extends StatefulWidget {
  const sem({super.key});

  @override
  State<sem> createState() => _semState();
}

class _semState extends State<sem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Semester",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.pink[800],
      ),
      body: Container(
        color: Colors.pink[800],
        child: Container(
          // height: 400,
          margin: EdgeInsets.only(top: 80),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
            color: Colors.white,
          ),
          child: GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount:3 ,
            mainAxisSpacing: 40,
            crossAxisSpacing: 10,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  height: 100,
                  child: Center(child: Text("1",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  child: Center(child: Text("2",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  child: Center(child: Text("3",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  child: Center(child: Text("4",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  child: Center(child: Text("5",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectSelectionPage()),);
                },
                child: Container(
                  child: Center(child: Text("6",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}