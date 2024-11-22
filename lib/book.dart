import 'package:bca_course/PDFOpen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart'; // Import for file download

class PDF1 {
  String? title;
  String? index;
  String? link;
  PDF1(this.title, this.index, this.link);
}

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var commonColor = Colors.pink[800];

  // List of PDF1 objects
  static List<PDF1> mainModelList = [
    PDF1("HTML - HTML5", "H", "https://www.tutorialspoint.com/html5/html5_tutorial.pdf"),
    PDF1("C++-Balaguru.pdf", "C++", "https://notalentgeek.github.io/note/note/project/project-independent/pi-brp-beginning-c-programming/document/20170807-1504-cet-1-book-and-source-1.pdf"),
    PDF1("COMP-Morris Mano.pdf", "COMP", "https://aiict.edu.bd/wp-content/uploads/2022/09/ansi-c-balaguruswamy-c-language-PDFDrive.com-.pdf"),
    PDF1("DS-rema thareja.pdf", "DS", "https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf"),
  ];

  // Display list, initially showing all items
  List<PDF1> displayList = List.from(mainModelList);

  // Update the display list based on the search query
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
        title: const Text(
          "Download Books",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.pink[800],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.pink[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      final pdfItem = displayList[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
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
                            width: 90,
                            height: 100, // Setting the width for a consistent design
                            padding: const EdgeInsets.all(10),
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: InkWell(
                            onTap: () {
                              print('Opening URL: ${pdfItem.link}'); // Debugging
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Pdfopen(pdfPath: pdfItem.link!),
                                ),
                              );
                            },
                            child: const Text(
                              "View PDF",
                              style: TextStyle(color: Colors.pink),
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
            ],
          ),
        ),
      ),
    );
  }
}
