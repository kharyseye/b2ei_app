import 'package:b2ei_app/model/Request.dart';
import 'package:b2ei_app/services/user_demande.dart';
import 'package:b2ei_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final String route;
  HistoryPage(this.route);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final UserDemande userdemande = UserDemande();

  @override
  Widget build(BuildContext context) {
    Future<void> showHistoryDialog(Request requestData) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(' Service : ${requestData.client}'),
            backgroundColor: Colors.green[100],
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Date : ${formatDate(requestData.timestamp.toDate(), format: 'EEEE d MMMM yyyy')}'),
                  Text('Affaire : ${requestData.affaire}'),
                  Text('Reference : ${requestData.reference}'),
                  Text('Designation : ${requestData.designation}'),
                  Text('Quantite : ${requestData.quantite}'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.picture_as_pdf),
                onPressed: () {},
                label: Text("PDF"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fermer")),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Mes demandes"),
      ),
      body: Center(
          child: StreamBuilder(
        stream: userdemande.getDemandeById(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (!snapshot.hasData) {
            return Text("Aucune demande");
          } else {
            List<Request> demandes = [];
            snapshot.data!.docs.forEach((data) {
              demandes.add(Request.fromData(data));
            });
            return ListView.builder(
              itemCount: demandes.length,
              itemBuilder: (context, index) {
                var id_demande = snapshot.data!.docs[index].id;
                final demande = demandes[index];

                final reference = demande.reference;

                final statut = demande.statut;

                return Card(
                  child: ListTile(
                    leading: Icon(
                      getIconData(statut),
                      color: getStatusColor(statut),
                    ),
                    title: Text(
                      "${formatStatut(statut)}",
                      style: TextStyle(
                        color: getStatusColor(statut),
                      ),
                    ),
                    subtitle: Text(
                      "REF: $reference",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Wrap(
                      spacing: -16,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.info,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            showHistoryDialog(demande);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      )),
    );
  }
}
