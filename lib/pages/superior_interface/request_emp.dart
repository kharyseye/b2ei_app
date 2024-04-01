import 'package:flutter/material.dart';

class Request_emp extends StatefulWidget {
  const Request_emp({super.key});

  @override
  State<Request_emp> createState() => _Request_empState();
}

class _Request_empState extends State<Request_emp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HISTORIQUE DES DEMANDES"),
      ),
    );
  }
}
