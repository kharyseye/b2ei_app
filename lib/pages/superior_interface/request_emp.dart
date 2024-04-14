//NE DOIT CONTENIR QUE LES DEMANDES ACCEPTER

import 'package:b2ei_app/model/Request.dart';
import 'package:b2ei_app/services/user_demande.dart';
import 'package:b2ei_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Request_emp extends StatefulWidget {
  @override
  State<Request_emp> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<Request_emp> {
  final UserDemande userDemande = UserDemande();
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
                      'Date : ${DateFormat.yMMMMd('en_US').add_jm().format(requestData.timestamp.toDate())}'),
                  Text('Affaire : ${requestData.affaire}'),
                  Text('Reference : ${requestData.reference}'),
                  Text('Designation : ${requestData.designation}'),
                  Text('Quantite : ${requestData.quantite}'),
                ],
              ),
            ),
            actions: <Widget>[
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
        title: Text("Les demandes"),
      ),
      body: Center(
          child: StreamBuilder(
        stream: userDemande.getDemandesStream(context, enattente: false),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Text("Aucune demande");
          }
          List<Request> demandes = snapshot.data!;
          return ListView.builder(
            itemCount: demandes.length,
            itemBuilder: (context, index) {
              final demande = demandes[index];
              final statut = demande.statut;
              final username = demande.name;
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
                  subtitle: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Utilisateur: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    TextSpan(
                        text: "$username",
                        style: TextStyle(
                          fontSize: 18,
                        ))
                  ])),

                  //subtitle: Text("$affaire,$client, $date, $quantite"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      showHistoryDialog(demande);
                    },
                  ),
                ),
              );
            },
          );
        },
      )),
    );
  }
}
