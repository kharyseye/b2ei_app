import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final  client;
  final Timestamp timestamp;
  final affaire ;
  final reference;
  final designation;
  final quantite;
  //final destinataire;
  //final Statut statut;


  Request({
  required this.client,
  required this.timestamp,
  required this.affaire,
  required this.reference,
  required this.designation,
  required this.quantite,
  //required this.destinataire,
  //required this.statut,
});
  factory Request.fromData(dynamic data){
    return Request(
        client: data['client'],
        timestamp: data['date'],
        affaire: data['affaire'],
        reference: data['reference'],
        designation: data['designation'],
        quantite: data['quantite'],
        //destinataire: data['destinataire'],
        //statut: data['statut'],
    );

  }

}
//enum Statut{en_attente, valide, refuse }