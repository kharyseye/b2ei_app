import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  String route;
  HistoryPage(this.route);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon historique"),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Image.asset("assets/images/history.jpg"),
                title: Text("demande de materiel N 001"),
                subtitle: Text("ici votre demande de materiel N 001"),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
