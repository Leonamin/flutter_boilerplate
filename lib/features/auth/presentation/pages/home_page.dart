import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../generated/l10n/app_localizations.dart';
import '../../../../shared/ui/components/app_button.dart';
import '../../../../shared/ui/components/app_scaffold.dart';
import '../../application/controllers/sign_out_controller.dart';
import '../../application/providers/auth_session_provider.dart';
import '../../domain/entities/auth_session.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final signOutState = ref.watch(signOutControllerProvider);
    final isSigningOut = signOutState.isLoading;
    final session = ref.watch(authSessionProvider);

    ref.listen<AsyncValue<void>>(signOutControllerProvider, (previous, next) {
      final error = next.error;
      if (error == null || previous?.error == error) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(localizations.commonUnexpectedError)),
      );
    });

    final email = session.value?.when(
      unauthenticated: () => null,
      authenticated: (user) => user.email,
    );

    return AppScaffold(
      appBar: AppBar(title: Text(localizations.homeTitle)),
      padding: const EdgeInsets.all(24),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  localizations.homeSignedInMessage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (email != null) ...[const SizedBox(height: 8), Text(email)],
                const SizedBox(height: 24),
                AppButton(
                  label: localizations.authSignOutAction,
                  isLoading: isSigningOut,
                  onPressed: isSigningOut
                      ? null
                      : () => ref
                            .read(signOutControllerProvider.notifier)
                            .signOut(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
