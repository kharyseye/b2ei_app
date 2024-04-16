/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Partie pour l'interface de l'administrateur
class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demandes Administrateur'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('demande').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Une erreur s\'est produite'),
            );
          }

          final demands = snapshot.data!.docs;

          return ListView.builder(
            itemCount: demands.length,
            itemBuilder: (context, index) {
              final demand = demands[index];
              final clientId = demand['id_user'];
              final clientType = demand['client'];
              final affaire = demand['affaire'];
              final reference = demand['reference'];
              final designation = demand['designation'];
              final quantite = demand['quantite'];
              final date = (demand['date'] as Timestamp).toDate();
              final status = demand['statut'];

              return ListTile(
                title: Text('Affaire: $affaire'),
                subtitle: Text('Client: $clientId\nDate: $date\nStatut: $status'),
                trailing: Text('Quantité: $quantite'),
                onTap: () {
                  // Afficher un dialogue ou une autre action pour permettre à l'administrateur
                  // d'accepter ou de refuser la demande
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Action sur la demande'),
                      content: Text('Accepter ou refuser cette demande ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            acceptDemand(demand.reference);
                            Navigator.pop(context);
                          },
                          child: Text('Accepter'),
                        ),
                        TextButton(
                          onPressed: () {
                            refuseDemand(demand.reference);
                            Navigator.pop(context);
                          },
                          child: Text('Refuser'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void acceptDemand(DocumentReference demandRef) {
    // Mettre à jour le statut de la demande dans Firestore
    demandRef.update({'statut': 'validé'});

    // Envoyer une notification à l'employé concerné
    // Code pour envoyer la notification
  }

  void refuseDemand(DocumentReference demandRef) {
    // Mettre à jour le statut de la demande dans Firestore
    demandRef.update({'statut': 'refusé'});

    // Envoyer une notification à l'employé concerné
    // Code pour envoyer la notification
  }
}
*/
