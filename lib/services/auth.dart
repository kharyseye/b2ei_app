import 'package:b2ei_app/services/user_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<UserPreferences>((ref) {
  return UserPreferences();
});

final authStateProvider = StateNotifierProvider<AuthStateNotifier, bool>((ref) {
  return AuthStateNotifier(ref.watch(authServiceProvider));
});

class AuthStateNotifier extends StateNotifier<bool> {
  final UserPreferences _authService;

  AuthStateNotifier(this._authService) : super(false) {
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final userId = await _authService.getUserId();
    state = userId != null;
  }
}
