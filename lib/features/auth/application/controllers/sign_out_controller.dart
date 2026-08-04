import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_repository_provider.dart';

final signOutControllerProvider =
    AsyncNotifierProvider.autoDispose<SignOutController, void>(
      SignOutController.new,
    );

class SignOutController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signOut() async {
    state = const AsyncLoading();
    final nextState = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );
    if (!ref.mounted) {
      return;
    }
    state = nextState;
  }
}
