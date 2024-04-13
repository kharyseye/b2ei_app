import 'package:cloud_firestore/cloud_firestore.dart';

class RequestService {
  // Définir une fonction pour mettre à jour le statut dans la base de données
  Future<void> updateStatus(String documentId, String newStatus) async {
    CollectionReference demandeRef = FirebaseFirestore.instance.collection("demande");
    await demandeRef.doc(documentId).update({'statut': newStatus});
  }

  // Lorsque l'administrateur accepte la demande
  Future<void> acceptRequest(String documentId) async {
    // Mettre à jour le statut de la demande dans la base de données
    await updateStatus(documentId, 'Validé');

    // Envoyer une notification au demandeur
    // Implémentez votre propre logique de notification
  }

  // Lorsque l'administrateur refuse la demande
  Future<void> rejectRequest(String documentId) async {
    // Mettre à jour le statut de la demande dans la base de données
    await updateStatus(documentId, 'Refusé');

    // Envoyer une notification au demandeur
    // Implémentez votre propre logique de notification
  }
}
