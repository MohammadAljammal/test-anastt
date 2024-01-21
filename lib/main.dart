import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<void> _createAndSharePDF() async {
    final pdf = pdfLib.Document();

    // Add content to the PDF
    pdf.addPage(pdfLib.Page(
      build: (context) {
        return pdfLib.Column(
          crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
          mainAxisAlignment: pdfLib.MainAxisAlignment.start,
          children: [

          ]
        );
      },
    ));

    // Save the PDF to a file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    final list = await pdf.save();
    await file.writeAsBytes(list.toList());

    // Share the PDF file
    Share.shareFiles([file.path], text: 'Check out this PDF!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter PDF and Share Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _createAndSharePDF,
          child: Text('Create PDF and Share'),
        ),
      ),
    );
  }
}
