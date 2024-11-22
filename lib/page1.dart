import 'package:bca_course/Home.dart';
import 'package:bca_course/page2.dart';
import 'package:bca_course/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment(0,0.95),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: Colors.red[900],
            child: Image.asset("assets/images/page1.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 520),
            alignment: Alignment(0.90,0),
            child: Column(
              children:[
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page2()),);
                  },
                  child: Container(
                    width: 40,
                    child: Image.asset("assets/images/next.png"),
                  ),
                ),
              ],
            ),
          ),
              // InkWell(
              //   onTap:(){
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()),);
              //   },
              //   child: Container(
              //     alignment: Alignment.topRight,
              //     width:40,
              //     margin: EdgeInsets.all(10),
              //     child: Image.asset("assets/images/right.png"),
              //   ),
              // ),
              // InkWell(
              //   onTap:(){
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => page2()),);
              //   },
              //   child: Container(
              //     alignment: Alignment.bottomRight,
              //     width:40,
              //     margin: EdgeInsets.all(10),
              //     child: Image.asset("assets/images/next.png"),
              //   ),
              // ),
            ],
          ),
    );
  }
}
