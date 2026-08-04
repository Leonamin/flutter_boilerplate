import 'package:flutter_boilerplate/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_user.dart';
import 'package:flutter_boilerplate/features/auth/domain/failures/auth_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InMemoryAuthRepository', () {
    test(
      'replays the current session and publishes authentication changes',
      () async {
        final repository = InMemoryAuthRepository();
        addTearDown(repository.dispose);

        final expectation = expectLater(
          repository.watchSession(),
          emitsInOrder([
            const AuthSession.unauthenticated(),
            const AuthSession.authenticated(
              user: AuthUser(
                id: 'person@example.com',
                email: 'person@example.com',
              ),
            ),
            const AuthSession.unauthenticated(),
          ]),
        );

        await repository.signIn(
          email: 'Person@Example.com',
          password: 'password1',
        );
        await repository.signOut();

        await expectation;
        expect(repository.currentSession, const AuthSession.unauthenticated());
      },
    );

    test('rejects invalid credentials with an auth domain failure', () async {
      final repository = InMemoryAuthRepository();
      addTearDown(repository.dispose);

      await expectLater(
        repository.signIn(email: 'not-an-email', password: 'password1'),
        throwsA(isA<InvalidEmail>()),
      );
      await expectLater(
        repository.signIn(email: 'person@example.com', password: 'short'),
        throwsA(isA<PasswordTooShort>()),
      );
    });
  });
}
