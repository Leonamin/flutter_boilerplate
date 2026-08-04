import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/providers/auth_session_provider.dart';
import '../../generated/l10n/app_localizations.dart';
import '../../shared/ui/components/app_button.dart';
import '../../shared/ui/components/app_loading_indicator.dart';
import '../../shared/ui/components/app_scaffold.dart';

class StartupPage extends ConsumerWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);

    return AppScaffold(
      padding: const EdgeInsets.all(24),
      body: Center(
        child: session.hasError
            ? ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      localizations.startupError,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      label: localizations.commonRetryAction,
                      onPressed: () => ref.invalidate(authSessionProvider),
                    ),
                  ],
                ),
              )
            : Semantics(
                label: localizations.startupLoading,
                child: const AppLoadingIndicator(),
              ),
      ),
    );
  }
}
