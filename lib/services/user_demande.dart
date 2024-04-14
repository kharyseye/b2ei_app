import 'package:b2ei_app/model/Request.dart';
import 'package:b2ei_app/model/Users.dart';
import 'package:b2ei_app/services/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDemande {
  Stream<QuerySnapshot<Map<String, dynamic>>> getDemandeById() async* {
    final String? userId = await UserPreferences().getUserId();

    if (userId != null) {
      yield* FirebaseFirestore.instance
          .collection("demande")
          .where('id_user', isEqualTo: userId)
          .snapshots();
    } else {
      // Gérer le cas où l'ID utilisateur n'est pas disponible
      throw Exception('User ID not available');
    }
  }

  Stream<List<Request>> getDemandesStream(BuildContext context) async* {
    final List<Request> initialDemandes = await getDemandesEnAttente(context);
    yield initialDemandes;

    yield* Stream.periodic(const Duration(seconds: 3), (count) async {
      try {
        final List<Request> demandes = await getDemandesEnAttente(context);
        return demandes;
      } catch (e) {
        return <Request>[];
      }
    }).asyncMap<List<Request>>((event) => Future.value(event));
  }

  Future<List<Request>> getDemandesEnAttente(BuildContext context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('demande')
        .where('statut', isEqualTo: 'en Attente')
        .get();

    List<Request> demandes = [];

    for (DocumentSnapshot doc in querySnapshot.docs) {
      final demande = Request.fromData(doc);
      final userId = demande.id_user;

      final userQuerySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();

      final Users user = Users.fromData(userQuerySnapshot.docs.single.data());
      demandes.add(Request.fromData(doc, user: user));
    }

    return demandes;
  }
}
