import 'package:flutter_boilerplate/features/auth/application/controllers/sign_in_controller.dart';
import 'package:flutter_boilerplate/features/auth/application/controllers/sign_out_controller.dart';
import 'package:flutter_boilerplate/features/auth/application/providers/auth_repository_provider.dart';
import 'package:flutter_boilerplate/features/auth/application/providers/auth_session_provider.dart';
import 'package:flutter_boilerplate/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('auth controllers', () {
    test(
      'sign in uses the overridden repository and updates the session',
      () async {
        final repository = InMemoryAuthRepository();
        final container = ProviderContainer(
          overrides: [authRepositoryProvider.overrideWithValue(repository)],
        );
        addTearDown(container.dispose);

        final initialSession = await container.read(authSessionProvider.future);
        expect(initialSession, const AuthSession.unauthenticated());

        await container
            .read(signInControllerProvider.notifier)
            .signIn(email: 'person@example.com', password: 'password1');

        expect(
          container.read(signInControllerProvider),
          isA<AsyncData<void>>(),
        );
        expect(
          repository.currentSession,
          const AuthSession.authenticated(
            user: AuthUser(
              id: 'person@example.com',
              email: 'person@example.com',
            ),
          ),
        );
      },
    );

    test(
      'sign out uses the overridden repository and clears the session',
      () async {
        final repository = InMemoryAuthRepository();
        await repository.signIn(
          email: 'person@example.com',
          password: 'password1',
        );
        final container = ProviderContainer(
          overrides: [authRepositoryProvider.overrideWithValue(repository)],
        );
        addTearDown(container.dispose);

        expect(
          await container.read(authSessionProvider.future),
          const AuthSession.authenticated(
            user: AuthUser(
              id: 'person@example.com',
              email: 'person@example.com',
            ),
          ),
        );

        await container.read(signOutControllerProvider.notifier).signOut();

        expect(
          container.read(signOutControllerProvider),
          isA<AsyncData<void>>(),
        );
        expect(repository.currentSession, const AuthSession.unauthenticated());
      },
    );
  });
}
