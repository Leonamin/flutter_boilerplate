import 'package:flutter_boilerplate/features/auth/domain/entities/auth_session.dart';

abstract interface class AuthRepository {
  AuthSession get currentSession;

  Stream<AuthSession> watchSession();

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  void dispose();
}
