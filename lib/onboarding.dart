import 'package:bca_course/Home.dart';
import 'package:bca_course/page1.dart';
import 'package:bca_course/page2.dart';
import 'package:bca_course/page3.dart';
import 'package:bca_course/sem1subject.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  PageController _control = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _control,
          children: [
            // Pdfopen(),
            // // // SubjectSelectionPage(),
            page1(),
            page2(),
            page3(),
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment(0.9,0),
              child: Column(
              children:[
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()),);
                  },
                  child: Container(
                    width: 40,
                    child: Image.asset("assets/images/right.png"),
                  ),
                ),
              ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 450),
                child: SmoothPageIndicator(controller: _control, count: 3)),
          ],
        ),
        Container(
          alignment: Alignment(0,0.90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 520),
        //   alignment: Alignment(0.90,0),
        //   child: Column(
        //     children:[
        //       InkWell(
        //         onTap: (){
        //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()),);
        //         },
        //         child: Container(
        //           width: 40,
        //           child: Image.asset("assets/images/next.png"),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

      ],
    );
  }
}