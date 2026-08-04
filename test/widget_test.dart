import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/features/auth/application/providers/auth_repository_provider.dart';
import 'package:flutter_boilerplate/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_boilerplate/features/auth/domain/entities/auth_session.dart';
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('signs in and signs out through the app shell', (tester) async {
    final repository = InMemoryAuthRepository();
    addTearDown(repository.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'person@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('You are signed in.'), findsOneWidget);
    expect(find.text('person@example.com'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Sign out'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('retries a session restoration error from startup', (
    tester,
  ) async {
    final repository = _FailOnceAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text("We couldn't restore your session."), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Try again'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
  });
}

final class _FailOnceAuthRepository implements AuthRepository {
  int _readCount = 0;

  @override
  AuthSession get currentSession {
    _readCount += 1;
    if (_readCount == 1) {
      throw StateError('Session restoration failed.');
    }
    return const AuthSession.unauthenticated();
  }

  @override
  void dispose() {}

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {}

  @override
  Future<void> signOut() async {}

  @override
  Stream<AuthSession> watchSession() => const Stream.empty();
}
