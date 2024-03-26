import 'package:b2ei_app/services/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDemande {
  Stream<QuerySnapshot<Map<String, dynamic>>> getDemandeById() async* {
    final String? userId =  await UserPreferences.getUserId();

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
}
