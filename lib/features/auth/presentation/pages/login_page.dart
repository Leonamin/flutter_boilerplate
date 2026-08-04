import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/features/auth/application/controllers/sign_in_controller.dart';
import 'package:flutter_boilerplate/features/auth/domain/failures/auth_failure.dart';
import 'package:flutter_boilerplate/generated/l10n/app_localizations.dart';
import 'package:flutter_boilerplate/shared/ui/components/app_button.dart';
import 'package:flutter_boilerplate/shared/ui/components/app_scaffold.dart';
import 'package:flutter_boilerplate/shared/ui/components/app_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final signInState = ref.watch(signInControllerProvider);
    final isSigningIn = signInState.isLoading;

    ref.listen<AsyncValue<void>>(signInControllerProvider, (previous, next) {
      final error = next.error;
      if (error == null || previous?.error == error) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage(localizations, error))),
      );
    });

    return AppScaffold(
      padding: const EdgeInsets.all(24),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: AutofillGroup(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      localizations.authLoginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 32),
                    AppTextField(
                      controller: _emailController,
                      label: localizations.authEmailLabel,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [
                        AutofillHints.username,
                        AutofillHints.email,
                      ],
                      validator: (value) =>
                          _validateEmail(localizations, value),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _passwordController,
                      label: localizations.authPasswordLabel,
                      isObscured: _isPasswordObscured,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      validator: (value) =>
                          _validatePassword(localizations, value),
                      onSubmitted: (_) => _submit(isSigningIn: isSigningIn),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        tooltip: localizations.authPasswordLabel,
                        onPressed: () {
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                        icon: Icon(
                          _isPasswordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AppButton(
                      label: localizations.authSignInAction,
                      isLoading: isSigningIn,
                      onPressed: isSigningIn
                          ? null
                          : () => _submit(isSigningIn: isSigningIn),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit({required bool isSigningIn}) {
    if (isSigningIn || !(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    TextInput.finishAutofillContext();
    unawaited(
      ref
          .read(signInControllerProvider.notifier)
          .signIn(
            email: _emailController.text,
            password: _passwordController.text,
          ),
    );
  }

  String? _validateEmail(AppLocalizations localizations, String? value) {
    final email = value?.trim() ?? '';
    final hasValidEmailFormat = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);
    if (email.isEmpty || !hasValidEmailFormat) {
      return localizations.authInvalidCredentials;
    }
    return null;
  }

  String? _validatePassword(AppLocalizations localizations, String? value) {
    if ((value ?? '').length < 8) {
      return localizations.authInvalidCredentials;
    }
    return null;
  }

  String _errorMessage(AppLocalizations localizations, Object error) {
    if (error is AuthFailure) {
      return localizations.authInvalidCredentials;
    }
    return localizations.commonUnexpectedError;
  }
}
