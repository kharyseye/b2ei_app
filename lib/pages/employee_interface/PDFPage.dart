import 'package:flutter/material.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({super.key});

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: Center(
        child: Text("FICHER PDF"),
      ),
    );
  }
}

