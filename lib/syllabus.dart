import 'package:bca_course/PDFOpen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class syllabusBCA {
  String? title;
  int? index;
  String? link;
  syllabusBCA(this.title, this.index, this.link);
}

class syllabus extends StatefulWidget {
  const syllabus({super.key});

  @override
  State<syllabus> createState() => _syllabusState();
}

class _syllabusState extends State<syllabus> {
  var commonColor = Colors.pink[800];

  // List of syllabusBCA objects
  static List<syllabusBCA> mainModelList = [
    syllabusBCA("BCA Semester I Syllabus.pdf", 1,
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
    syllabusBCA("BCA Semester II Syllabus.pdf", 2,
        'https://vpmpce.wordpress.com/wp-content/uploads/2018/06/3310701computer_programming.pdf'),
    syllabusBCA("BCA Semester III Syllabus.pdf", 3,
        'https://cucse.org/BTech_Syllabus_detailed.pdf'),
    syllabusBCA("BCA Semester IV Syllabus.pdf", 4,
        'https://dde.pondiuni.edu.in/wp-content/uploads/2021/08/Syllabus-UG-B.Com_.pdf'),
    syllabusBCA("BCA Semester V Syllabus.pdf", 5,
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
  ];

  // Display list, initially showing all items
  List<syllabusBCA> displayList = List.from(mainModelList);
  void updateList(String value) {
    setState(() {
      // Filter the main model list by matching the title
      displayList = mainModelList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Download Syllabus",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.pink[800],
      ),
      body: Container(
        color: Colors.pink[800],
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white70,
            ),
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final pdfItem = displayList[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: commonColor,
                      ),
                      width: 70,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          '${pdfItem.index}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        pdfItem.title!,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: InkWell(
                      onTap: () {
                        print('Opening URL: ${pdfItem.link}'); // Debugging
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                Pdfopen(pdfPath: pdfItem.link!),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "View PDF",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        // Download the PDF file
                        FileDownloader.downloadFile(
                          url: pdfItem.link!,
                          onProgress: (name, progress) {
                            print('Downloading: $name, progress: $progress%');
                          },
                          onDownloadCompleted: (path) {
                            print('Downloaded to: $path');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Downloaded to: $path')
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
