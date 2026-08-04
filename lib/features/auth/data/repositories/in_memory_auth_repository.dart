import 'dart:async';

import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';

/// A deterministic authentication implementation for a newly created app.
///
/// Replace this at the application composition root with a real repository;
/// feature code must continue to depend only on [AuthRepository].
final class InMemoryAuthRepository implements AuthRepository {
  InMemoryAuthRepository()
    : _currentSession = const AuthSession.unauthenticated();

  static const int _minimumPasswordLength = 8;

  final StreamController<AuthSession> _sessionController =
      StreamController<AuthSession>.broadcast(sync: true);
  AuthSession _currentSession;
  bool _isDisposed = false;

  @override
  AuthSession get currentSession => _currentSession;

  @override
  Stream<AuthSession> watchSession() {
    _ensureNotDisposed();

    return Stream<AuthSession>.multi((controller) {
      controller.add(_currentSession);
      final subscription = _sessionController.stream.listen(
        controller.add,
        onError: controller.addError,
        onDone: controller.close,
      );
      controller.onCancel = subscription.cancel;
    });
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    _ensureNotDisposed();

    final normalizedEmail = email.trim().toLowerCase();
    _validateCredentials(email: normalizedEmail, password: password);

    _updateSession(
      AuthSession.authenticated(
        user: AuthUser(id: normalizedEmail, email: normalizedEmail),
      ),
    );
  }

  @override
  Future<void> signOut() async {
    _ensureNotDisposed();
    _updateSession(const AuthSession.unauthenticated());
  }

  @override
  void dispose() {
    if (_isDisposed) {
      return;
    }

    _isDisposed = true;
    _sessionController.close();
  }

  void _validateCredentials({required String email, required String password}) {
    if (email.isEmpty) {
      throw const AuthFailure.missingEmail();
    }

    final hasValidEmailFormat = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);
    if (!hasValidEmailFormat) {
      throw const AuthFailure.invalidEmail();
    }

    if (password.isEmpty) {
      throw const AuthFailure.missingPassword();
    }

    if (password.length < _minimumPasswordLength) {
      throw const AuthFailure.passwordTooShort(
        minimumLength: _minimumPasswordLength,
      );
    }
  }

  void _updateSession(AuthSession session) {
    _currentSession = session;
    _sessionController.add(session);
  }

  void _ensureNotDisposed() {
    if (_isDisposed) {
      throw StateError('The auth repository has already been disposed.');
    }
  }
}
