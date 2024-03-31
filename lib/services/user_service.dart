import 'package:b2ei_app/model/Users.dart';
import 'package:b2ei_app/services/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Stream<Users> getUserInfo() async* {
    final String? userId = await UserPreferences().getUserId();
    final uid = userId;
    if (userId != null) {
      final user = FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid);
      final getuser = await user.get();
      final userData = getuser.docs.single.data();

      yield Users.fromData(userData);
    } else {
      // Gérer le cas où l'ID utilisateur n'est pas disponible
      throw Exception('User ID not available');
    }
  }
}
