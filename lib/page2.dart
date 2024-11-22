import 'package:bca_course/Home.dart';
import 'package:bca_course/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/page2.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 520),
              alignment: Alignment(0.90,0),
              child: Column(
                children:[
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page3()),);
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
