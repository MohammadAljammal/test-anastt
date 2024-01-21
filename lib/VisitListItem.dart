import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';




class VisitListItem extends StatelessWidget {
  const VisitListItem(
      {Key? key,  this.controller, required this.visits})
      : super(key: key);
  final ScrollController? controller;
  final List<Visit> visits;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
          controller: controller,
          key: PageStorageKey("pageState"),
          itemCount: visits.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color:
                  Colors.blue[500]),
              padding: EdgeInsets.all(2),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Provider.of<VisitsProvider>(context, listen: false)
                    //     .setSelectedVisit(index);
                  },
                  onLongPress: () {
                    // Show the share option when long-pressed
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.lightBlue,
                      builder: (BuildContext context) {
                        return ListTile(
                          title: Text('shareAllVisitResults,',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                          onTap: () {
                            // Create a string with the visit information
                            String visitInfo =
                                '${visits[index].getVisitDay()} - ${visits[index].getVisitMonth()} - ${visits[index].getVisitYear()}';
                            Share.share(visitInfo);
                            Navigator.pop(context); // Close the bottom sheet
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    '${visits[index].getVisitDay()} - ${visits[index].getVisitMonth()} - ${visits[index].getVisitYear()} ',
                    style: TextStyle(
                      color:  Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Future<void> _createAndSharePDF() async {
  final pdf = pw.Document();

  // Add content to the PDF
  pdf.addPage(pw.Page(
    build: (context) {
      return pw.Center(
        child: pw.Text("Hello, this is a PDF document!"),
      );
    },
  ));

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/example.pdf");
  final list = await pdf.save();
  await file.writeAsBytes(list.toList());
  Share.shareFiles([file.path], text: 'Check out this PDF!');
}