import 'package:b2ei_app/services/user_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<UserPreferences>((ref) {
  return UserPreferences();
});

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(ref.watch(authServiceProvider));
});

class AuthState {
  final bool isAuthenticated;
  final bool isSupervisor;

  AuthState({required this.isAuthenticated, required this.isSupervisor});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final UserPreferences _authService;

  AuthStateNotifier(this._authService)
      : super(AuthState(isAuthenticated: false, isSupervisor: false)) {
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final userId = await _authService.getUserId();
    final isSupervisor = await _authService.getSupervisor();
    state = AuthState(
      isAuthenticated: userId != null,
      isSupervisor: isSupervisor ?? false,
    );
  }
}
