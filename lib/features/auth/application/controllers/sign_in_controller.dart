import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_repository_provider.dart';

final signInControllerProvider =
    AsyncNotifierProvider.autoDispose<SignInController, void>(
      SignInController.new,
    );

class SignInController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    final nextState = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .signIn(email: email, password: password),
    );
    if (!ref.mounted) {
      return;
    }
    state = nextState;
  }
}
