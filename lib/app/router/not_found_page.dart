import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/router/app_routes.dart';
import 'package:flutter_boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter_boilerplate/shared/ui/components/app_button.dart';
import 'package:flutter_boilerplate/shared/ui/components/app_scaffold.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({required this.uri, super.key});

  final Uri uri;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return AppScaffold(
      padding: const EdgeInsets.all(24),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localizations.commonErrorPageNotFound,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                localizations.commonErrorPageDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(uri.path, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 24),
              AppButton(
                label: localizations.commonButtonGoHome,
                onPressed: () => const HomeRoute().go(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
