import 'package:b2ei_app/model/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  final id;
  final client;
  final Timestamp timestamp;
  final affaire;
  final reference;
  final designations;
  //final quantite;
  final Statut statut;
  final id_user;
  final String? name;

  Request(
      {required this.id,
        required this.client,
        required this.timestamp,
        required this.affaire,
        required this.reference,
        required this.designations,
        //required this.quantite,
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
    } else if (statutString == 'Refusé') {
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
        designations: data['designations'],
        //quantite: data['quantite'],
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

