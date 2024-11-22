import 'package:bca_course/COMP.dart';
import 'package:bca_course/Ds.dart';
import 'package:bca_course/Fos.dart';
import 'package:bca_course/OOCP.dart';
import 'package:bca_course/PDFOpen.dart';
import 'package:bca_course/page1.dart';
import 'package:bca_course/page2.dart';
import 'package:bca_course/page3.dart';
import 'package:bca_course/statistical.dart';
import 'package:flutter/material.dart';

class Subject {
  String? title;
  String? subtitle;
  Widget Function()? pagemove;  // Function that returns the page to navigate to
  Subject(this.title, this.subtitle, this.pagemove);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SubjectSelectionPage(),
    );
  }
}
class SubjectSelectionPage extends StatelessWidget {
  final List<Subject> sub = [
    Subject('C', 'COMP', () => COMP()),
    Subject('D', 'DS', () => Ds()),
    Subject('O', 'OOCP', () => Oocp()),
    Subject('F', 'FOS', () => Fos()),
    Subject('S', 'Statistical', () => statistical()),
  ];

  List<Subject> display = [];

  SubjectSelectionPage() {
    display = List.from(sub);
  }

  final commoncolor = Colors.pink[800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commoncolor,
        title: Text(
          'Choose Subject',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: commoncolor,
        child: Container(
          margin: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 50.0,
              ),
              itemCount: display.length,
              itemBuilder: (context, index) {
                final pdfItem = display[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to the corresponding page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => pdfItem.pagemove!(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: commoncolor,
                        child: Text(
                          pdfItem.title!,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      pdfItem.subtitle!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: commoncolor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
