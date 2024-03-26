import 'package:b2ei_app/pages/impression/PDFPage.dart';
import 'package:b2ei_app/model/Request.dart';
import 'package:b2ei_app/services/user_demande.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Dashboard.dart';

class HistoryPage extends StatefulWidget {
  String route;
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
                  Text('Date : ${DateFormat.yMMMMd('en_US').add_jm().format(requestData.timestamp.toDate())}'),
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
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => PDFPage(),
                        )
                    );
                  },
                  label: Text("PDF")),
              ElevatedButton(
                  onPressed: (){
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
        title: Text("Mon historique"),
      ),
      body: Center(
        child: StreamBuilder(
          stream:userdemande.getDemandeById(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(!snapshot.hasData){
              return Text("Aucune demande");
            }else{
              List<Request> demandes = [];
              snapshot.data!.docs.forEach((data) {
                demandes.add(Request.fromData(data));
              });
              return  ListView.builder(
                itemCount: demandes.length,
                itemBuilder: (context, index){
                  var id_demande = snapshot.data!.docs[index].id;
                  final demande = demandes[index];
                  final client = demande.client;
                  final Timestamp timestamp = demande.timestamp;
                  final String date = DateFormat.yMMMMd('en_US').add_jm().format(timestamp.toDate());
                  final affaire = demande.affaire;
                  final reference = demande.reference;
                  final designation = demande.designation;
                  final quantite = demande.quantite;

                  return Card(
                    child: ListTile(
                      //leading: Image.asset("assets/images/history.jpg"),
                      title: Text("REF: $reference",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                      //subtitle: Text("$affaire,$client, $date, $quantite"),
                      trailing: Wrap(
                        spacing: -16,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.info,
                            color: Colors.green,
                            ),
                            onPressed: () {
                              showHistoryDialog(demande);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit,
                              color: Colors.yellow,
                            ),
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () async{
                              await FirebaseFirestore.instance
                                  .collection("demande")
                                  .doc(id_demande)
                                  .delete();
                            },
                          ),
                        ],
                      ),
                      ),
                    );
                },
              );
            }

          } ,
        )
      ),
    );
  }
}
