import 'package:b2ei_app/pages/FormPage.dart';
import 'package:b2ei_app/pages/PDFPage.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon historique"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("demande").snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(!snapshot.hasData){
              return Text("Aucune demande");
            }
            List<dynamic> demandes = [];
            snapshot.data!.docs.forEach((element) {
              demandes.add(element);
            });
            return  ListView.builder(
              itemCount: demandes.length,
              itemBuilder: (context, index){
                final demande = demandes[index];
                final client = demande['client'];
                final Timestamp timestamp = demande['date'];
                final String date = DateFormat.yMMMMd('en_US').add_jm().format(timestamp.toDate());
                final affaire = demande['affaire'];
                final reference = demande['reference'];
                final designation = demande['designation'];
                final quantite = demande['quantite'];

                return Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/history.jpg"),
                    title: Text("REF: $reference,  $designation",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                    subtitle: Text("$affaire,$client, $date, $quantite"),
                    trailing: IconButton(
                      icon :Icon(Icons.remove_red_eye,
                      color: Colors.blue,),
                      onPressed: () {},
                    ),

                    onTap: (){
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFPage() ,
                          ));*/
                    },
                  ),
                );
              },
            );
          } ,
        )
      ),
    );
  }
}
