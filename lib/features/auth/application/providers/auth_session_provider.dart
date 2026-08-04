import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_session.dart';
import 'auth_repository_provider.dart';

final authSessionProvider =
    AsyncNotifierProvider<AuthSessionController, AuthSession>(
      AuthSessionController.new,
    );

class AuthSessionController extends AsyncNotifier<AuthSession> {
  @override
  FutureOr<AuthSession> build() {
    final repository = ref.watch(authRepositoryProvider);
    final subscription = repository.watchSession().listen(
      (session) {
        if (ref.mounted) {
          state = AsyncData(session);
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (ref.mounted) {
          state = AsyncError(error, stackTrace);
        }
      },
    );
    ref.onDispose(subscription.cancel);
    return repository.currentSession;
  }
}
