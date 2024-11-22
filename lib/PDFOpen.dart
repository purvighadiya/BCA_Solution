import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class Pdfopen extends StatefulWidget {
  final String pdfPath;
  Pdfopen({super.key, required this.pdfPath});

  @override
  State<Pdfopen> createState() => _PdfopenState();
}

class _PdfopenState extends State<Pdfopen> {
  // late PDFViewController pdfViewController;
  final PdfViewerController _pdfViewerController = PdfViewerController();
  Uint8List? _pdfBytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My PDF Document"),
      ),
      body: Scrollbar(
        // child: SfPdfViewer.asset(
        //   'assets/UnitFour.pdf',
        // ),
        child: SfPdfViewer.network(widget.pdfPath),
      ),
    );
  }

}
