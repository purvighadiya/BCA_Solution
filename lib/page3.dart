import 'package:bca_course/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Stack(
          children: [
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/page3.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 520),
              alignment: Alignment(0.90,0),
              child: Column(
                children:[
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()),);
                    },
                    child: Container(
                      width: 40,
                      child: Image.asset("assets/images/next.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}