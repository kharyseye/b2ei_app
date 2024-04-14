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
import 'package:b2ei_app/model/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final id;
  final client;
  final Timestamp timestamp;
  final affaire;
  final reference;
  final designation;
  final quantite;
  final Statut statut;
  final id_user;
  final String? name;

  Request(
      {required this.id,
      required this.client,
      required this.timestamp,
      required this.affaire,
      required this.reference,
      required this.designation,
      required this.quantite,
      required this.statut,
      required this.id_user,
      required this.name});

  factory Request.fromData(DocumentSnapshot data, {Users? user}) {
    // Récupération de la chaîne de caractères du statut
    final statutString = data['statut'] ?? 'enAttente';
    final id = data.id;
    final getusername = user;
    final name = getusername?.username;

    // Conversion de la chaîne de caractères en enum Statut
    Statut statut;
    if (statutString == 'Validé') {
      statut = Statut.valide;
    } else if (statutString == 'refuse') {
      statut = Statut.refuse;
    } else {
      statut = Statut.enAttente;
    }

    return Request(
        id: id,
        client: data['client'],
        timestamp: data['date'],
        affaire: data['affaire'],
        reference: data['reference'],
        designation: data['designation'],
        quantite: data['quantite'],
        statut: statut,
        id_user: data['id_user'],
        name: name);
  }
}

enum Statut {
  enAttente,
  valide,
  refuse,
}
