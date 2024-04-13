/*
import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final  client;
  final Timestamp timestamp;
  final affaire ;
  final reference;
  final designation;
  final quantite;
  //final destinataire;
  final Statut statut;


  Request({
  required this.client,
  required this.timestamp,
  required this.affaire,
  required this.reference,
  required this.designation,
  required this.quantite,
  //required this.destinataire,
  required this.statut,
});


  factory Request.fromData(dynamic data){
    return Request(
        client: data['client'],
        timestamp: data['date'],
        affaire: data['affaire'],
        reference: data['reference'],
        designation: data['designation'],
        quantite: data['quantite'],
        statut: data['statut']
    );

        // Conversion de la chaîne de caractères en enum Statut
        Statut statut;
            if (statut == 'valide') {
              statut = Statut.valide;
            }else if (statut == 'refuse') {
            statut = Statut.refuse;
            } else {
            statut = Statut.enAttente;
            }


  }

}
enum Statut {
  enAttente,
  valide,
  refuse,
}

*/
import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final client;
  final Timestamp timestamp;
  final affaire;
  final reference;
  final designation;
  final quantite;
  final Statut statut;

  Request({
    required this.client,
    required this.timestamp,
    required this.affaire,
    required this.reference,
    required this.designation,
    required this.quantite,
    required this.statut,
  });

  factory Request.fromData(dynamic data) {
    // Récupération de la chaîne de caractères du statut
    final statutString = data['statut'] ?? 'enAttente';

    // Conversion de la chaîne de caractères en enum Statut
    Statut statut;
    if (statutString == 'valide') {
      statut = Statut.valide;
    } else if (statutString == 'refuse') {
      statut = Statut.refuse;
    } else {
      statut = Statut.enAttente;
    }

    return Request(
      client: data['client'],
      timestamp: data['date'],
      affaire: data['affaire'],
      reference: data['reference'],
      designation: data['designation'],
      quantite: data['quantite'],
      statut: statut, // Attribution du statut converti à la propriété
    );
  }
}

enum Statut {
  enAttente,
  valide,
  refuse,
}
