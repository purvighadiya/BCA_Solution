import 'package:bca_course/PDFOpen.dart';
import 'package:bca_course/page2.dart';
import 'package:bca_course/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Subject {
  String? title;
  String? subtitle;
  String? link;
  Subject(this.title, this.subtitle, this.link);
}

class Ds extends StatefulWidget {
  const Ds({super.key});

  @override
  State<Ds> createState() => _COMPState();
}

class _COMPState extends State<Ds> {
  final commoncolor = Colors.pink[800];
  final List<Subject> sub = [
    Subject('DS_2015.pdf', '2015', 'https://czmgbca.oshwaleducationtrust.org/papers/DS%202015.pdf'),
    Subject('DS_2016.pdf', '2016', 'https://czmgbca.oshwaleducationtrust.org/papers/DS%202018.pdf'),
    Subject('DS_2017.pdf', '2017', 'https://czmgbca.oshwaleducationtrust.org/papers/DS%202017.pdf'),
  ];

  List<Subject> display = [];

  @override
  void initState() {
    super.initState();
    display = List.from(sub); // Initialize display with the sub list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: commoncolor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Download Material',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Container(
        color: commoncolor,
        child: Container(
          margin: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 3 columns
                // crossAxisSpacing: 20.0,
                mainAxisSpacing: 30.0,  // Reduce the mainAxisSpacing to fit better
              ),
              itemCount: display.length,
              itemBuilder: (context, index) {
                final pdfItem = display[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('Opening URL: ${pdfItem.link}');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Pdfopen(pdfPath: pdfItem.link!),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30.0, // Reduced size to prevent overflow
                        backgroundColor: commoncolor,
                        child: Icon(Icons.picture_as_pdf, size: 30.0, color: Colors.white), // Adjusted icon size
                      ),
                    ),
                    SizedBox(height: 1.0), // Reduced spacing
                    Flexible( // Added Flexible widget to prevent overflow
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Ensures children take only the necessary space
                        children: [
                          Text(
                            pdfItem.title!,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: commoncolor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            pdfItem.subtitle!,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: commoncolor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            icon: const Icon(Icons.download),
                            onPressed: () {
                              FileDownloader.downloadFile(
                                url: pdfItem.link!,
                                onProgress: (name, progress) {
                                  print('Downloading: $name, progress: $progress%');
                                },
                                onDownloadCompleted: (path) {
                                  print('Downloaded to: $path');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Downloaded to: $path')),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
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
