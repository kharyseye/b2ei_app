import 'package:firebase_auth/firebase_auth.dart';

Future<void> changePassword(String email, String currentPassword, String newPassword) async {
  try {
    // Récupérer l'utilisateur actuel
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Créer une référence au provider d'authentification par e-mail et mot de passe
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);

    // Re-authentifier l'utilisateur
    await currentUser?.reauthenticateWithCredential(credential);

    // Changer le mot de passe
    await currentUser?.updatePassword(newPassword);

    print("Mot de passe changé avec succès !");
  } catch (e) {
    print("Erreur lors du changement de mot de passe : $e");
    // Gérer les erreurs ici
  }
}