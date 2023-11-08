import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;

class DownloadResume extends StatelessWidget {
  const DownloadResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnchorElement anchorElement() {
      return AnchorElement();
    }

    void downloadPdfFromAssets() async {
      var pdfData = await rootBundle
          .load('Bryan_Olivares_Resume.pdf');
      var anchor = anchorElement();
      var blob = Blob([pdfData], 'application/pdf');
      anchor.href = Url.createObjectUrl(blob);
      anchor.download = 'Bryan_Olivares_Resume.pdf';
      anchor.click();
    }

    return ElevatedButton(
        onPressed: () {
          downloadPdfFromAssets();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Text("Download My Resume"),
        ));
  }
}